//
//  NewSplashView.swift
//  MafiaGame
//
//  Created by Artem on 13.12.2023.
//

import Foundation

import SwiftUI

struct NewSplashView: View {
    
    @EnvironmentObject var vm: GameCharacterData
    @State var saturation = 0.6
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            LogoView()
            .saturation(saturation)
            .animation(.easeIn(duration: 0.8),value: saturation)
            .preferredColorScheme(.dark)
            .onAppear {
                saturation = 1
            }
            .opacity(sin(2*vm.animeCount))
            .saturation(1 + vm.animeCount)
        }
        .onAppear {
            vm.animeTimer()
        }
    }
}
        
struct NewSplashView_Previews: PreviewProvider {
    static var previews: some View {
        NewSplashView(saturation: 0.2)
    }
}
