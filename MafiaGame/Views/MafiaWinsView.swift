//
//  MafiaWinsView.swift
//

import SwiftUI

struct MafiaWinsView: View {
    @StateObject var vm = DollarAnimationViewModel()
    @State var radians: Double = 0.5
    @State var saturation: Double = 0
    @State var textOpacity: Double = 0
    @State var degrees: Double = -35
    @State var radiusFactor: Double = 0
    @State var dollarOneOffset: Double = -700
    @State var dollarOneDegree: Double = 0
    @State var dollarOffsetY: Double = 0
    @State var dollarAngle: Double = 0
    var dollars = Array(repeating: Int.random(in: 1...4), count: 10)
    
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
                RadialGradient(colors: [Color("cubeGrad").opacity(0.01),Color("cubeGrad").opacity(0.1),Color("cubeGrad").opacity(0)], center: .center, startRadius: 3 * radiusFactor, endRadius: 180 * radiusFactor)
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
                RadialGradient(colors: [Color("cubeGrad").opacity(0),Color("cubeGrad").opacity(0.1),Color("cubeGrad").opacity(0)], center: .center, startRadius: 11 * radiusFactor, endRadius: 270 * radiusFactor)
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
                    .shadow(color: Color("mafiaWinsColor").opacity(0.64), radius: 60, x: 0, y: 0)
                    .shadow(color: .black.opacity(0.64), radius: 4, x: 0, y: 0)
                    .saturation(saturation)
                    .animation(.easeIn(duration: 3), value: saturation)
                    Button {
                        
                    } label: {
                        Text("Press to continue")
                            .font(Font.custom("Roboto-Black", size: 32))
                            .foregroundColor(.white.opacity(textOpacity))
                            .animation(.easeIn(duration: 1), value: textOpacity)
                    }
                }
                .offset(y: -geo.size.height * 0.3)
                Group {
                    Image("framer")
                        .resizable()
                        .scaledToFit()
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        .scaleEffect(0.5)
                        .frame(height: geo.size.height/2)
                        .offset(x: geo.size.width/9, y: geo.size.height/9)
                    
                    Image("mafia")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.6)
                        .frame(height: geo.size.height/2)
                        .offset(x: -geo.size.width/2.6, y: geo.size.height/10)
                        .hueRotation(.degrees(-10))
                        .saturation(1.5)
                    
                    Image("mafioso")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(0.9)
                        .frame(height: geo.size.height/2)
                        .offset(x: geo.size.width/2.7, y: 0 )
                    
                    Image("godfather")
                        .resizable()
                        .scaledToFit()
                        .scaleEffect(1)
                        .frame(height: geo.size.height/2)
                        .offset(x: -geo.size.width/8, y: geo.size.height/12)
                }
                
                VStack {
                    Spacer()
                    LinearGradient(gradient: Gradient(colors: [
                        Color("floorMafiaTop"),
                        Color("floorMafiaMid"),
                        Color("floorMafiaBot")]),
                                   startPoint: .top,
                                   endPoint: .bottom)
                    .frame(width: geo.size.width, height: geo.size.height/9)
                    .offset(y: -geo.size.height/10)
                    .saturation(saturation)
                    .animation(.easeInOut(duration: 7), value: saturation)
                }
                
                Image("mafiacar")
                   
                    .resizable()
                    .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                   
                    .frame(width: geo.size.width, height: geo.size.height/4, alignment: .bottomLeading)
                    .scaleEffect(0.6, anchor: .leading)
                    .saturation(1)
                    .hueRotation(.degrees(-15))
                    .offset(x:-geo.size.width/10, y: geo.size.height/4.2)
                   
                    .shadow(color: .black, radius: 40, x: 25, y: 45)
                    .colorMultiply(Color("multiplyColor"))
                
                Image("mafiacar")
                    .resizable()
                    .frame(width: geo.size.width, height: geo.size.height/4, alignment: .bottomLeading)
                    .scaleEffect(0.9, anchor: .trailing)
                    .offset(x: geo.size.width/8)
                    .offset(y: geo.size.height/3.7)
                    .shadow(color: .black, radius: 20, x: 15, y: 35)
                    .hueRotation(.degrees(10))
                
                Image("dollar2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .rotation3DEffect(.degrees(dollarOneDegree), axis: (x: 0, y: 1, z: 1))
                    .offset(y: dollarOneOffset)
                    .blur(radius: 1)
                    .animation(.easeOut(duration: 45), value: dollarOneOffset)
                    .animation(.easeOut(duration: 45), value: dollarOneDegree)
                
                ForEach(dollars, id: \.self) { dollar in
                    Image("dollar" + String(dollar))
                        .resizable()
                        .scaledToFit()
                        .rotation3DEffect(.degrees(.random(in: -180...180)), axis: (x: .random(in: (0...1)), y: .random(in: 0...1), z: .random(in: 0...1)))
                        .frame(width: 100, height: 100)
                        .offset(x: .random(in: -250...250), y: .random(in: -250...250))
                        .blur(radius: 1)
                       .animation(.easeInOut(duration: 45), value: dollarOffsetY)
                        .animation(.easeOut, value: dollarAngle)
                }
                
                
            }
            .onAppear {
                radians = 0
                saturation = 1
                degrees = -45
                radiusFactor = 1
                dollarOneOffset = 1000
                dollarOneDegree = 190
               // vm.addDollars()
                dollarAngle = 360
                dollarOffsetY = 1000
                //vm.updateDollars()
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    textOpacity = 0.8
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
