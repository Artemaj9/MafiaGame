//
//  MafiaGameApp.swift
//  MafiaGame
//
//  Created by Artem on 01.12.2023.
//

import SwiftUI

@main
struct MafiaGameApp: App {
    
    @StateObject var gameCharacterData = GameCharacterData()
    var body: some Scene {
        WindowGroup {
            TabBar()
                .environmentObject(gameCharacterData)
        }
    }
}
