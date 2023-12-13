//
//  DropDelegate.swift
//  MafiaGame
//
//  Created by Artem on 10.12.2023.
//

import SwiftUI
import MobileCoreServices

class GameCharacterData: ObservableObject, DropDelegate {
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
    
    func startGame() {
        isGame = true
        mafiaCount = selectedCharacters.filter { $0.type == "mafia" }.count
        citizenCount = selectedCharacters.filter { $0.type == "citizen" }.count
        print("BIG GAME BEGIN!")
        print("MAfia Count : \(mafiaCount)")
        print("Citizen count: \(citizenCount)")
    }

    func resetGame() {
        isGame = false
        selectedCharacters.removeAll()
        endGame = 0
        citizenCount = 0
        mafiaCount = 0
        busted = 0
        isEnd = false
    }
    
    func checkGame()   {
        if isGame && mafiaCount >= citizenCount {
            isEnd = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.endGame = -1
            }
        }
        
        if isGame && mafiaCount == 0 {
            isEnd =  true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.endGame = 1
            }
        }
    }
    
func setElementToChange(id: UUID) {
    elementToChange = selectedCharacters.firstIndex { $0.id == id } ?? 0
    print(elementToChange)
    }
    
    func performDrop(info: DropInfo) -> Bool {
        
        showAlert = true
        // adding images to bottom view...
        for provider in info.itemProviders(for: [String(kUTTypeURL)]) {
            // checking if its available
            if provider.canLoadObject(ofClass: URL.self) {
                print("url loaded")
                let _ = provider.loadObject(ofClass: URL.self) { (url, error) in
                    print(url!)
                        DispatchQueue.main.async {
                            withAnimation(.easeOut) {
                                self.selectedCharacters.append(GameCharacterCell(id: UUID(), image: "\(url!)"))
                                self.elementToChange = self.selectedCharacters.count - 1
                                print(self.elementToChange)
                            }
                        }
                    }
                }
        }
        
        return true
    }
}
