//
//  HomeViewModel.swift
//

import Foundation
import Combine

class MainAiViewModel: ObservableObject {
    private let openAIAPI = OpenAIAPI()
    
    @Published var messages: [ChatModel] = []
    private var cancellables = Set<AnyCancellable>()
    
    func addMessage(isAI: Bool, message: String){
        messages.append(ChatModel(id: UUID().uuidString, isAI: isAI, message: message))
        
        if !isAI{
            autoAIResponse()
            sendChatGPTRequest(prompt: message)
        }
    }
    
    func autoAIResponse() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            let aiResponse = AIAnswerModel.allCases.randomElement()!.message
            self?.messages.append(ChatModel(id: UUID().uuidString, isAI: true, message: aiResponse))
        }
    }
    
    func sendChatGPTRequest(prompt: String) {
        openAIAPI.chatGPT(prompt: prompt)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print("Chat GPT API request failed with error: \(error.localizedDescription)")
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] value in
                self?.addMessage(isAI: true, message: value)
            })
            .store(in: &cancellables)
    }
}
