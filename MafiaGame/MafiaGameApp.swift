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
            if gameCharacterData.splash {
                NewSplashView()
                    .environmentObject(gameCharacterData)
            } else if !gameCharacterData.firstStart {
                TabBar()
                    .environmentObject(gameCharacterData)
            } else {
                NewOnboardingView()
                    .environmentObject(gameCharacterData)
            }
        }
    }
}
