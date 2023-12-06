//
//  UIColor+Color.swift
//

import Foundation
import UIKit
import SwiftUI

extension UIColor {
    static let theme = ColorTheme()
    
    struct ColorTheme {
        let firstListItemColor = UIColor(named: "firstListItemColor")
        let secondListItemColor = UIColor(named: "secondListItemColor")
        let thirdListItemColor = UIColor(named: "thirdListItemColor")
    }
}

extension Color {
    static let theme = ColorTheme()
    
    struct ColorTheme {
        let firstListItemColor = Color("firstListItemColor")
        let secondListItemColor = Color("secondListItemColor")
        let thirdListItemColor = Color("thirdListItemColor")
    }
}
