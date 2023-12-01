//
//  CityView.swift
//  MafiaGame
//
//  Created by Artem on 02.12.2023.
//

import SwiftUI

struct CityView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ZStack {
                Color("citizenBg")
                RadialGradient(colors: [.black.opacity(0),.black.opacity(0.2),.black.opacity(0.3) ], center: .center, startRadius: 10, endRadius: 30)
                    .mask {
                        Image("citizenRays")
                            .resizable()
                            .scaledToFit()
                            .opacity(1)
                    }
                
                RadialGradient(colors: [Color("cubeGrad"),Color("cubeGrad").opacity(0.42),Color("cubeGrad").opacity(0) ], center: .center, startRadius: 1, endRadius: 230)
                    .offset(y: 0)
                    .mask {
                        Image("citizenFigure")
                            .resizable()
                            .blur(radius: 2)
                            .scaledToFit()
                    }
                //  Radia
                
                // .opacity(0.8)
                
                //                .opacity(0.2)
                Image("citizen")
                    .resizable()
                    .scaledToFit()
                    .padding()
                
                //                .background {
                //                    RadialGradient(colors: [.gray, .black], center: .center, startRadius: 10, endRadius: 400)
                //                       .blur(radius: 1)
                
                //
                //                    RadialGradient(colors: [.white, .green.opacity(0.8)], center: .center, startRadius: 10, endRadius: 200)
                //                        //.blur(radius: 0)
                //                        .mask {
                //                            Image("citizenRays")
                //                                .resizable()
                //                                .scaledToFill()
                //                                .opacity(0.8)
                //                                .colorMultiply(.white)
                //                        }
                //                        .padding()
                //     }
            }
        }
      
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView()
    }
}
