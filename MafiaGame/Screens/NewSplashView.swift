//
//  NewSplashView.swift
//  MafiaGame
//
//  Created by Artem on 13.12.2023.
//

import Foundation

import SwiftUI

struct NewSplashView: View {
    
    //  @State var saturation = 0.6
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
        }
    }
}
        
struct NewSplashView_Previews: PreviewProvider {
    static var previews: some View {
        NewSplashView(saturation: 0.2)
    }
}
