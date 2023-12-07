//
//  GameViewModel.swift
//  MafiaGame
//
//  Created by Artem on 07.12.2023.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @AppStorage("onboardingHasShown") var onboardingHasShown = false
}
