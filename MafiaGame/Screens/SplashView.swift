//
//  SplashView.swift
//

import SwiftUI

struct SplashView: View {
    
    @State var saturation = 0.6
    
    var body: some View {
        ZStack {
            Image("bgsplash")
                .resizable()
                .ignoresSafeArea()
            
            GeometryReader { geo in
                Image("logoman")
                    .scaledToFit()
                    .frame(width: geo.size.width,
                           height: geo.size.height,
                           alignment: .center)
                    .offset(y: -geo.size.height/12)

                
                Image("logo")
                    .frame(width: geo.size.width,
                           height: geo.size.height,
                           alignment: .center)
                    .offset(y: geo.size.height/12)
            }
            .saturation(saturation)
            .animation(.easeIn(duration: 0.8),value: saturation)
           

        }
        .preferredColorScheme(.dark)
        .onAppear {
            saturation = 1
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
