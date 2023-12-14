//
//  OpenAIAPI.swift
//

import Foundation
import Combine

class OpenAIAPI {
    private let chatGTPEndpoint = "https://api.openai.com/v1/chat/completions"
    
    private let token = 
     "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"
    
    func chatGPT(prompt: String) -> AnyPublisher<String, Error> {
        let messageModel = ["role": "user", "content": prompt]
        let parameters = [
            "model": "gpt-3.5-turbo",
            "messages": [messageModel]
        ] as [String : Any]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: parameters)

        let url = URL(string: chatGTPEndpoint)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = jsonData
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      200..<300 ~= httpResponse.statusCode else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: ChatGPTModel.self, decoder: JSONDecoder())
            .map { $0.choices[0].message.content }
            .eraseToAnyPublisher()
    }
}
