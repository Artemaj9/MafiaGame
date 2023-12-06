//
//  DollarAnimationViewModel.swift
//  MafiaGame
//
//  Created by Artem on 04.12.2023.
//

import SwiftUI
import Combine

final class DollarAnimationViewModel: ObservableObject {
    
    var avtodollars = [DollarAnimatableProperties]()
    var backdollars = [DollarAnimatableProperties]()
    
    func updateDolars () {
        for _ in 1...30 {
            avtodollars.append(DollarAnimatableProperties(speed: .random(in: 1.5...9.0), angularSpeed: .random(in: 0.5...10), initialXOffset:.random(in: -150...150), initialYOffset: .random(in: -4500 ... -800), number: .random(in: 1...4), axisX: .random(in: 0...1), axisY: .random(in: 0...1), axisZ: .random(in: 0...1), saturation: .random(in: 0.8...1.2), hueRotation: .random(in: -15...15)))
        }
        
        for _ in 1...50 {
            backdollars.append(DollarAnimatableProperties(speed: .random(in: 0.1...5), angularSpeed: .random(in: 0.5...15), initialXOffset:.random(in: -170...170), initialYOffset: .random(in: -1200 ... -600), number: .random(in: 1...4), axisX: .random(in: 0...1), axisY: .random(in: 0...1), axisZ: .random(in: 0...1), saturation: .random(in: 0.8...1.2), hueRotation: .random(in: -15...15)))
        }
    }
}
    
struct DollarAnimatableProperties: Hashable {
    let speed: Double
    let angularSpeed: Double
    let initialXOffset: Double
    let initialYOffset: Double
    let number: Int
    let axisX : Double
    let axisY: Double
    let axisZ: Double
    let saturation: Double
    let hueRotation: Double
}
