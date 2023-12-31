//
//  DropDelegate.swift
//  

import SwiftUI
import Combine
import MobileCoreServices
import UniformTypeIdentifiers

class GameControlModel: ObservableObject, DropDelegate {
    @Published var totalImages = [GameCharacterCell]()
    @Published var selectedCharacters = [GameCharacterCell]()
    @Published var showAlert = false
    @Published var mafiaCount = 0
    @Published var citizenCount = 0
    @Published var isGame = false
    @Published var endGame = 0
    @Published var isEnd = false
    @Published var elementToChange = 0
    @Published var busted = 0
    @Published var splash = true
    @Published var animeCount = 0.0
    @Published var peopleInGame = 0
    @Published var leftCount = 0
    @Published var bustedAndLeft = 0
    @AppStorage("firstStart") var firstStart = true
    private var cancellables = Set<AnyCancellable>()
    
    func startGame() {
        isGame = true
      //  mafiaCount = selectedCharacters.filter { $0.type == "mafia" }.count
       // citizenCount = selectedCharacters.filter { $0.type == "citizen" }.count
        peopleInGame = selectedCharacters.count - busted - leftCount + bustedAndLeft
    }

    func resetGame() {
        isGame = false
        selectedCharacters.removeAll()
        endGame = 0
        citizenCount = 0
        mafiaCount = 0
        bustedAndLeft = 0
        leftCount = 0
        busted = 0
        isEnd = false
    }
    func animeTimer() {
        Timer
            .publish(every: 0.05, on: .main, in: .common)
            .autoconnect()
            .sink { [unowned self] _ in
                animeCount += 0.05
            
                if animeCount >= 1  {
                    splash = false
                    for item in cancellables {
                        item.cancel()
                    }
                }
            }
            .store(in: &cancellables)
    }
    
    
    func checkGame()   {
        if isGame && mafiaCount >= citizenCount {
            isEnd = true
            resetGame()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.endGame = -1
            }
        }
        
        if isGame && mafiaCount == 0 {
            isEnd =  true
            resetGame()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.endGame = 1
            }
        }
        peopleInGame = selectedCharacters.count - busted - leftCount + bustedAndLeft
    }
    
func setElementToChange(id: UUID) {
    elementToChange = selectedCharacters.firstIndex { $0.id == id } ?? 0
    }
    
    func performDrop(info: DropInfo) -> Bool {
        
        showAlert = true
        for provider in info.itemProviders(for: [UTType.url]) {
            if provider.canLoadObject(ofClass: URL.self) {
                let _ = provider.loadObject(ofClass: URL.self) { (url, error) in
                        DispatchQueue.main.async {
                            withAnimation(.easeOut) {
                                self.selectedCharacters.append(GameCharacterCell(id: UUID(), image: "\(url!)"))
                                self.elementToChange = self.selectedCharacters.count - 1
                            }
                        }
                    }
                }
        }
        
        return true
    }
}
