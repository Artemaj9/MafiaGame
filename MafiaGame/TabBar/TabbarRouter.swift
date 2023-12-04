//
//  TabbarRouter.swift
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
