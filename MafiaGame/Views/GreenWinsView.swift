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
                .animation(.easeInOut(duration: 5), value: radiusFactor)
                .mask {
                    Image("rays")
                        .rotationEffect(.degrees(degrees), anchor: .center)
                        .scaleEffect(0.9)
                        .offset(y: -200)
                        .animation(.easeInOut(duration: 7), value: degrees)
                }
            RadialGradient(colors: [Color("cubeGrad").opacity(0),Color("cubeGrad").opacity(0.4),Color("cubeGrad").opacity(0)], center: .center, startRadius: 11 * radiusFactor, endRadius: 300 * radiusFactor)
                .saturation(saturation)
                .blur(radius: 40)
                .offset(y: -200)
                .animation(.easeInOut(duration: 4), value: radiusFactor)
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


struct GreenWinsView_Previews: PreviewProvider {
    static var previews: some View {
        GreenWinsView()
    }
}
