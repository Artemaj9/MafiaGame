//
//  GameViewModel.swift
//  MafiaGame
//
//  Created by Artem on 07.12.2023.
//

import SwiftUI
import Combine

class GameViewModel: ObservableObject {
    @AppStorage("onboardingHasShown") var onboardingHasShown = false
    @Published var remainingTime = 90
    @Published var timerIsOn = false
    @Published var isPaused = true
    @Published var opacityCount = 0

    private var cancellables = Set<AnyCancellable>()
    
    func setUpTimer() {
        timerIsOn = true
        isPaused = false
        remainingTime = 90
        
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [unowned self] _ in
                if !isPaused {
                    remainingTime -= 1
                }
            
                if remainingTime <= 0 || !timerIsOn {
                    for item in cancellables {
                        item.cancel()
                        timerIsOn = false
                        isPaused = true
                    }
                }
            }
            .store(in: &cancellables)
    }
    
    func resetTimer() {
        remainingTime = 90
        timerIsOn = false
        isPaused = true
    }
    
    func animationTransition() {
        Timer
            .publish(every: 0.01, on: .main, in: .common)
            .autoconnect()
            .sink { [unowned self] _ in
                opacityCount += 2

                if opacityCount >= 100 {
                    opacityCount = 0
                    for item in cancellables {
                        item.cancel()
                    }
                }
            }
            .store(in: &cancellables)
    }
}
