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
            
            GeometryReader { geo in
                Group {
                    Image("draw")
                        .rotationEffect(.degrees(-25))
                        .offset(y: geo.size.height/4)
                    Image("draw")
                        .rotationEffect(.degrees(-5))
                        .offset(y: geo.size.height*0.3)
                    Image("draw")
                        .rotationEffect(.degrees(-30))
                        .offset(x: geo.size.height*0.27, y: geo.size.height*0.3)
                    Image("draw")
                        .rotationEffect(.degrees(30))
                        .offset(x: geo.size.height*0.27, y: geo.size.height*0.3)
                }
                .offset(y: geo.size.height/8)
                
                Group {
                    Color("darkcity")
                        .mask {
                            Image("city")
                                .resizable()
                                .rotation3DEffect(.degrees(180), axis: (x:0, y: 1, z: 0))
                                .scaledToFit()
                                .scaleEffect(1.2)
                                .frame(width: geo.size.width * 0.7,
                                       height: geo.size.height*0.1,
                                       alignment: .center)
                        }
                        .offset(y: -geo.size.height*0.07)
                    
                    
                    Color("darkcity")
                        .mask {
                            Image("bigbuilding")
                                .resizable()
                                .scaledToFit()
                                .scaleEffect(2)
                                .frame(width: geo.size.width * 0.7,
                                       height: geo.size.height*0.1,
                                       alignment: .center)
                        }
                        .offset(x: -geo.size.width*0.09, y: -geo.size.height*0.1)
                    
                    
                    Color("whitecity")
                        .mask {
                            Image("city")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geo.size.width * 0.7,
                                       height: geo.size.height/4,
                                       alignment: .center)
                        }
                        .offset(y: -geo.size.height/16)
                }
                VStack(spacing: 0) {
                    Text("mafia")
                    Text("Game")
                    Text("Mastery")
                }
                .font(Font.custom("pricedown", size: 78))
               
                
      
                
              
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
        
struct NewSplashView_Previews: PreviewProvider {
    static var previews: some View {
        NewSplashView(saturation: 0.2)
    }
}
