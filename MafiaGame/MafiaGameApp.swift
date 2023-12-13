//
//  MafiaGameApp.swift
//

import SwiftUI

@main
struct MafiaGameApp: App {
    
    @StateObject var gameCharacterData = GameControlModel()
    
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
