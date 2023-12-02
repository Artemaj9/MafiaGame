//
//  TabbarRouter.swift
//  MafiaGame
//
//  Created by Artem on 02.12.2023.
//
import SwiftUI

class TabbarRouter: ObservableObject {
    @Published var currentPage: Page = .game
}

enum Page {
    case game
    case city
    case help
}
