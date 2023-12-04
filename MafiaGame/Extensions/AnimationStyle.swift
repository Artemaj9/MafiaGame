//
//  AnimationStyle.swift
//

import SwiftUI

// MARK: - AnimationButtons

struct ThemeAnimationStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.85 : 1.0)
    }
}
