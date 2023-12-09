//
//  SearchAnimationHelper.swift
//

import Combine
import SwiftUI

class AnimationHelper: ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var count = 1.0
 
    func setUpTimer() {
        count = 0
        Timer
            .publish(every: 0.05, on: .main, in: .common)
            .autoconnect()
            .sink { [unowned self] _ in
                count += 0.1
                if count >= 1 {
                    for item in cancellables {
                        item.cancel()
                    }
                }
            }
            .store(in: &cancellables)
    }
}
