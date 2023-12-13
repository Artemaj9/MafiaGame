//
//  NewSplashView.swift
//  


import Foundation

import SwiftUI

struct NewSplashView: View {
    
    @EnvironmentObject var vm: GameControlModel
    @State var saturation = 0.0
    
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
        }
        .onAppear {
            vm.animeTimer()
        }
    }
}        
