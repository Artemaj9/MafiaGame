//
//  MafiaWinsView.swift
//  MafiaGame
//
//  Created by Artem on 04.12.2023.
//

import SwiftUI

struct MafiaWinsView: View {
    @State var radians: Double = 0.5
    @State var saturation: Double = 0
    @State var textOpacity: Double = 0
    @State var degrees: Double = -35
    @State var radiusFactor: Double = 0
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("bgnight")
                    .resizable()
                    .hueRotation(.radians(radians))
                    .saturation(saturation)
                    .ignoresSafeArea()
                    .animation(.easeInOut(duration: 5), value: radians)
                    .animation(.easeIn(duration: 7), value: saturation)
                RadialGradient(colors: [Color("cubeGrad").opacity(0.1),Color("cubeGrad").opacity(0.3),Color("cubeGrad").opacity(0)], center: .center, startRadius: 3 * radiusFactor, endRadius: 180 * radiusFactor)
                    .blur(radius: 40)
                    .offset(y:  -geo.size.height * 0.3)
                    .animation(.easeInOut(duration: 7), value: radiusFactor)
                    .mask {
                        Image("rays")
                            .rotationEffect(.degrees(degrees), anchor: .center)
                            .scaleEffect(0.9)
                            .offset(y:  -geo.size.height * 0.3)
                            .animation(.easeInOut(duration: 12), value: degrees)
                    }
                RadialGradient(colors: [Color("cubeGrad").opacity(0),Color("cubeGrad").opacity(0.4),Color("cubeGrad").opacity(0)], center: .center, startRadius: 11 * radiusFactor, endRadius: 270 * radiusFactor)
                    .saturation(saturation)
                    .blur(radius: 40)
                    .offset(y:  -geo.size.height * 0.3)
                    .animation(.easeInOut(duration: 7), value: radiusFactor)
                    .mask {
                        
                        Image("rays")
                            .offset(y:  -geo.size.height * 0.3)
                    }
                VStack {
                    Group {
                        Text("MAFIA")
                            .font(Font.custom("Roboto-Black", size: 36))
                        Text("WINS")
                            .font(Font.custom("Roboto-Black", size: 88))
                    }
                    .foregroundColor(Color("mafiaWinsColor"))
                    .shadow(color: .black.opacity(0.64), radius: 4, x: 0, y: 0)
                    .saturation(saturation)
                    .animation(.easeIn(duration: 3), value: saturation)
                    Button {
                        
                    } label: {
                        Text("Press to continue")
                            .font(Font.custom("Roboto-Black", size: 32))
                            .foregroundColor(.black.opacity(textOpacity))
                            .animation(.easeIn(duration: 1), value: textOpacity)
                    }
                }
                .offset(y: -geo.size.height * 0.3)
                Group {
                    Image("citizen")
                        .resizable()
                        .scaledToFit()
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        .scaleEffect(0.6)
                        .frame(height: geo.size.height/2)
                        .offset(x: geo.size.width/9, y: geo.size.height/12)
                    
                    Image("doctor")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.7)
                        .frame(height: geo.size.height/2)
                        .offset(x: -geo.size.width/2.5, y: geo.size.height/12)
                    
                    Image("cop")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.9)
                        .frame(height: geo.size.height/2)
                        .offset(x: geo.size.width/2.3, y: geo.size.height/8)
                    
                    Image("sheriff")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.9)
                        .frame(height: geo.size.height/2)
                        .offset(x: -geo.size.width/8, y: geo.size.height/40)
                }
                
                VStack {
                    Spacer()
                    LinearGradient(gradient: Gradient(colors: [
                        Color("floorGradTop"),
                        Color("floorGradMid"),
                        Color("floorGradBot")]),
                                   startPoint: .top,
                                   endPoint: .bottom)
                    .frame(width: geo.size.width, height: geo.size.height/9)
                    .offset(y: -geo.size.height/10)
                    .saturation(saturation)
                    .animation(.easeInOut(duration: 7), value: saturation)
                }
                
                Image("citizencar1")
                   
                    .resizable()
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                   
                    .frame(width: geo.size.width, height: geo.size.height/4, alignment: .bottomLeading)
                    .scaleEffect(0.6, anchor: .leading)
                    .saturation(0.8)
                    

                    .offset(x:-geo.size.width/10, y: geo.size.height/4.2)
                   
                    .shadow(color: .black, radius: 40, x: 25, y: 45)
                    .colorMultiply(Color("multiplyColor"))
                
                Image("citizencar1")
                    .resizable()

                    .frame(width: geo.size.width, height: geo.size.height/4, alignment: .bottomLeading)
                    .scaleEffect(0.9, anchor: .trailing)
                    .offset(x: geo.size.width/8)
                    .offset(y: geo.size.height/3.7)
                    .shadow(color: .black, radius: 20, x: 15, y: 35)
            }
            .onAppear {
                radians = 0
                saturation = 1
                degrees = -45
                radiusFactor = 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    textOpacity = 0.64
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}
    

struct MafiaWinsView_Previews: PreviewProvider {
    static var previews: some View {
        MafiaWinsView()
    }
}
