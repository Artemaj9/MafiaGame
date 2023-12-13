//
//  TabbarRouter.swift
//

import SwiftUI

class TabbarRouter: ObservableObject {
    @Published var currentPage: Page = .city
}

enum Page {
    case game
    case city
    case help
}
