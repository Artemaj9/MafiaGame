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
    @Published var dollars = Array(repeating: Int.random(in: 1...4), count: 10)
    @Published var dollarOffset = 0
    @Published var dollar1Offset = -500

    
    func setUpTimer() {
        Timer
            .publish(every: 0.1, on: .main, in: .common)
            .autoconnect()
            .sink { [unowned self] _ in
                count += 1
                dollar1Offset += 10
            }
            .store(in: &cancellables)
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
    
struct DollarState: Hashable {
   // var offsetX: Double //= Double.random(in: -250...250)
   // var offsetY: Double //= Double.random(in: -1400 ... -800)
   // var angle: Double //= Double.random(in: -360...360)
    var number = Int.random(in: 1...4)
    
  //  mutating func updateOffsetY (newValue: Double) {
    //    offsetY += newValue
    //}
}
