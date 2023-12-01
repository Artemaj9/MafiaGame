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
            Color("magicColor")
                    ZStack {
                        Color("citizenBg")
                        RadialGradient(colors: [.black.opacity(0),.black.opacity(0.3) ], center: .center, startRadius: 10, endRadius: 30)
                            .blur(radius: 10)
                            .mask {
                                Image("citizenRays")
                                    .resizable()
                                    .scaledToFit()
                                    .hueRotation(.degrees(75))
                                    .opacity(1)
                                
                            }
                        
                       
                    }
            Image("citizen")
                .resizable()
                .scaledToFit()
                .padding()
                .background {
                    RadialGradient(colors: [Color("cubeGrad"),Color("cubeGrad").opacity(0.42),Color("cubeGrad").opacity(0) ], center: .center, startRadius: 1, endRadius: 230)
                        .offset(y: 0)
                        .mask {
                            Image("citizenFigure")
                                .resizable()
                                .blur(radius: 2)
                                .scaledToFit()
                        }
                }
            
                }
               
            }
    }

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView()
    }
}
