//
//  DollarAnimationViewModel.swift
//  MafiaGame
//
//  Created by Artem on 04.12.2023.
//

import SwiftUI
import Combine

final class DollarAnimationViewModel: ObservableObject {
    
    // Cancellables
    private var cancellables = Set<AnyCancellable>()
    
    @Published var count: Double = 0
    @Published var fallingTime = 45.0
   var dollariOffset = [-700.0, -1000.0, -750.0, -1200.0, -730.0, -500.0, -900.0, -600, -1200]
    
//    var dollars = [
//        DollarAnimatableProperties(speed: 1, angularSpeed: 2, initialXOffset: -170, initialYOffset: -700, number: 2, axisX: 0.1, axisY: 1, axisZ: 0.3),
//        DollarAnimatableProperties(speed: 1.5, angularSpeed: 1, initialXOffset: -150, initialYOffset: -1000, number: 3, axisX: 1,axisY: 1,axisZ: 0),
//        DollarAnimatableProperties(speed: 2.5, angularSpeed: 0.8, initialXOffset: 150, initialYOffset: -600, number: 1, axisX: 0,axisY: 1,axisZ: 0),
//        DollarAnimatableProperties(speed: 2.5, angularSpeed: 3.8, initialXOffset: 200, initialYOffset: -600, number: 4, axisX: 1,axisY: 1,axisZ: 0),
//        DollarAnimatableProperties(speed: 5.5, angularSpeed: 7.8, initialXOffset: 130, initialYOffset: -900, number: 2, axisX: 1,axisY: 0,axisZ:1),
//        DollarAnimatableProperties(speed: 1.5, angularSpeed: 1.8, initialXOffset: 0, initialYOffset: -800, number: 3, axisX: 0.5,axisY: 0.3, axisZ: 1),
//        DollarAnimatableProperties(speed: 3.5, angularSpeed: 10.8, initialXOffset: 70, initialYOffset: -800, number: 3, axisX: 0.5,axisY: 0.3, axisZ: 1),
//        DollarAnimatableProperties(speed: 1.5, angularSpeed: 1.8, initialXOffset: 50, initialYOffset: -600, number: 1, axisX: 0.5,axisY: 0.4, axisZ: 0),
//        DollarAnimatableProperties(speed: 1.5, angularSpeed: 1.8, initialXOffset: -180, initialYOffset: -730, number: 2, axisX: 0.5,axisY: 0.3, axisZ: 1),
//        DollarAnimatableProperties(speed: 1.2, angularSpeed: 4.8, initialXOffset: 140, initialYOffset: -730, number: 2, axisX: 0.5,axisY: 0.3, axisZ: 1),
//        DollarAnimatableProperties(speed: 2.5, angularSpeed: 1.8, initialXOffset: 40, initialYOffset: -730, number: 2, axisX: 0.5,axisY: 1, axisZ: 1),
//        DollarAnimatableProperties(speed: 3.5, angularSpeed: 2.8, initialXOffset: -100, initialYOffset: -730, number: 1, axisX: 0.8,axisY: 0.3, axisZ: 1),
//        DollarAnimatableProperties(speed: 1.8, angularSpeed: 7.8, initialXOffset: -80, initialYOffset: -730, number: 4, axisX: 0.8,axisY: 0.7, axisZ: 0),
//        DollarAnimatableProperties(speed: 3.4, angularSpeed: 4.8, initialXOffset: 134, initialYOffset: -730, number: 3, axisX: 0.8,axisY: 0.2, axisZ: 1)]
    
    var avtodollars = [DollarAnimatableProperties]()
    var backdollars = [DollarAnimatableProperties]()
    // @Published var dollarOffset = 0
    @Published var dollarOffset: CGFloat = -500
    @Published var offsets = [Double]()
    // var offsets = [(Double, Double)]
    
    
    func setUpTimer() {
        Timer
            .publish(every: 0.1, on: .main, in: .common)
            .autoconnect()
            .sink { [unowned self] _ in
                count += 1
                dollarOffset += 10
            }
            .store(in: &cancellables)
    }
    
    func updateDolars () {
        for _ in 1...30 {
            avtodollars.append(DollarAnimatableProperties(speed: .random(in: 1.5...9.0), angularSpeed: .random(in: 0.5...10), initialXOffset:.random(in: -150...150), initialYOffset: .random(in: -4500 ... -800), number: .random(in: 1...4), axisX: .random(in: 0...1), axisY: .random(in: 0...1), axisZ: .random(in: 0...1), saturation: .random(in: 0.8...1.2), hueRotation: .random(in: -15...15)))
        }
        
        for _ in 1...50 {
            backdollars.append(DollarAnimatableProperties(speed: .random(in: 0.1...5), angularSpeed: .random(in: 0.5...15), initialXOffset:.random(in: -170...170), initialYOffset: .random(in: -1200 ... -600), number: .random(in: 1...4), axisX: .random(in: 0...1), axisY: .random(in: 0...1), axisZ: .random(in: 0...1), saturation: .random(in: 0.8...1.2), hueRotation: .random(in: -15...15)))
        }
        }

        
    }

//    func addDollars() {
//        for _ in 1...10 {
//            dollarPositions.append(
//                DollarState(
//                    offsetX: Double.random(in: -250...250),
//                    offsetY: Double.random(in: -250...250),
//                    angle: Double.random(in: -360...360)))
//        }
//    }

    
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


struct DollarState: Hashable {
   // var offsetX: Double //= Double.random(in: -250...250)
   // var offsetY: Double //= Double.random(in: -1400 ... -800)
   // var angle: Double //= Double.random(in: -360...360)
    var number = Int.random(in: 1...4)
    
  //  mutating func updateOffsetY (newValue: Double) {
    //    offsetY += newValue
    //}
}
