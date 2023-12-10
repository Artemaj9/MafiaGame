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
                            }
                        }
                    }
                }
        }
        
        return true
    }
}
