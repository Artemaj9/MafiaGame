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
    
    var dollars = [
        DollarAnimatableProperties(speed: 1, angularSpeed: 2, initialXOffset: -250, initialYOffset: -700, number: 2, axisX: 0.1, axisY: 1, axisZ: 0.3),
        DollarAnimatableProperties(speed: 1.5, angularSpeed: 1, initialXOffset: -150, initialYOffset: -1000, number: 3, axisX: 1,axisY: 1,axisZ: 0),
        DollarAnimatableProperties(speed: 2.5, angularSpeed: 0.8, initialXOffset: 150, initialYOffset: -600, number: 1, axisX: 0,axisY: 1,axisZ: 0),
        DollarAnimatableProperties(speed: 0.5, angularSpeed: 3.8, initialXOffset: 200, initialYOffset: -600, number: 4, axisX: 1,axisY: 1,axisZ: 0),
        DollarAnimatableProperties(speed: 3.5, angularSpeed: 0.8, initialXOffset: 230, initialYOffset: -700, number: 2, axisX: 1,axisY: 0,axisZ:1),
        DollarAnimatableProperties(speed: 1.5, angularSpeed: 1.8, initialXOffset: 100, initialYOffset: -800, number: 3, axisX: 0.5,axisY: 0.3, axisZ: 1),
        DollarAnimatableProperties(speed: 3.5, angularSpeed: 10.8, initialXOffset: 100, initialYOffset: -800, number: 3, axisX: 0.5,axisY: 0.3, axisZ: 1),
        DollarAnimatableProperties(speed: 1.5, angularSpeed: 1.8, initialXOffset: 120, initialYOffset: -600, number: 1, axisX: 0.5,axisY: 0.4, axisZ: 0),
        DollarAnimatableProperties(speed: 1.5, angularSpeed: 1.8, initialXOffset: 140, initialYOffset: -730, number: 2, axisX: 0.5,axisY: 0.3, axisZ: 1)]
    
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
    
    func vmUpdateDolars () {
        for _ in 1...10 {
            offsets.append(.random(in: -250...250))
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
