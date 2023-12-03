//
//  GreenWinsView.swift
//  MafiaGame
//
//  Created by Artem on 03.12.2023.
//

import SwiftUI

struct GreenWinsView: View {
    @State var radians: Double = 0.5
    @State var saturation: Double = 0
    @State var textOpacity: Double = 0
    @State var degrees: Double = -40
    @State var radiusFactor: Double = 0
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("bgday")
                    .resizable()
                    .hueRotation(.radians(radians))
                    .saturation(saturation)
                    .ignoresSafeArea()
                    .animation(.easeInOut(duration: 5), value: radians)
                    .animation(.easeIn(duration: 7), value: saturation)
                RadialGradient(colors: [Color("cubeGrad").opacity(0.1),Color("cubeGrad").opacity(0.3),Color("cubeGrad").opacity(0)], center: .center, startRadius: 3 * radiusFactor, endRadius: 180 * radiusFactor)
                    .blur(radius: 40)
                    .offset(y: -200)
                    .animation(.easeInOut(duration: 7), value: radiusFactor)
                    .mask {
                        Image("rays")
                            .rotationEffect(.degrees(degrees), anchor: .center)
                            .scaleEffect(0.9)
                            .offset(y: -200)
                            .animation(.easeInOut(duration: 9), value: degrees)
                    }
                RadialGradient(colors: [Color("cubeGrad").opacity(0),Color("cubeGrad").opacity(0.4),Color("cubeGrad").opacity(0)], center: .center, startRadius: 11 * radiusFactor, endRadius: 300 * radiusFactor)
                    .saturation(saturation)
                    .blur(radius: 40)
                    .offset(y: -200)
                    .animation(.easeInOut(duration: 7), value: radiusFactor)
                    .mask {
                        
                        Image("rays")
                            .offset(y: -200)
                    }
                VStack {
                    Group {
                        Text("CITIZENS")
                            .font(Font.custom("Roboto-Black", size: 36))
                        Text("WINS")
                            .font(Font.custom("Roboto-Black", size: 88))
                        //  Spacer()
                    }
                    .foregroundColor(Color("citizenWinsColor"))
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
                .offset(y: -200)
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
                    //.hueRotation(.degrees(-10))
                   // .blur(radius: 0.5)
                    //.opacity(0.8)
                    //.saturation(0.5)
                
                Image("citizencar1")
                    .resizable()

                    .frame(width: geo.size.width, height: geo.size.height/4, alignment: .bottomLeading)
                    .scaleEffect(0.9, anchor: .trailing)
                    .offset(x: geo.size.width/8)
                    .offset(y: geo.size.height/3.7)
                    .shadow(color: .black, radius: 20, x: 15, y: 35)

                    
                
                //            Image("")
                //
                //            Image("doctorWin")
                //                .resizable()
                //            Image("sherifWin")
                //                .resizable()
                //
                //            VStack {
                //                Spacer()
                //                HStack {
                //                    Image("citizencar1")
                //                        .resizable()
                //
                //                    //.frame(height: 200, width: 100)
                //                    // Image("citizencar2")
                //                    //    .resizable()
                //                }
                //            }
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


struct GreenWinsView_Previews: PreviewProvider {
    static var previews: some View {
        GreenWinsView()
    }
}
