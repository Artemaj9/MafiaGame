//
//  CityView.swift
//

import SwiftUI

struct CityView: View {
    
    var myGradient = Gradient(
        colors: [
            Color("strokeGrad4"),
            Color("strokeGrad3"),
            Color("strokeGrad2")
        ]
    )
    
    var body: some View {
        VStack {
            ZStack {
                Color.black.ignoresSafeArea()
                GeometryReader { geo in
                    VStack {
                        ZStack(alignment: .top) {
                            Image("citizen")
                                .resizable()
                                .scaledToFit()
                                .overlay {
                                    Rectangle()
                                        .stroke(
                                            LinearGradient(
                                                gradient: myGradient,
                                                startPoint: .bottom,
                                                endPoint: .top
                                            ),
                                            lineWidth: 3
                                        )
                                        .cornerRadius(1)
                                }
                                .padding()
                                .background {
                                    
                                    ZStack {
                                        RadialGradient(colors: [Color("citizenBg"),.black], center: .center, startRadius: 80, endRadius: 190)
                                        Color("citizenBg").opacity(0.4)
                                        
                                        RadialGradient(colors: [.black.opacity(0),.black.opacity(0.3) ], center: .center, startRadius: 10, endRadius: 90)
                                            .mask {
                                                Image("citizenRays")
                                                    .resizable()
                                                    .scaledToFit()
                                                
                                            }
                                        
                                        RadialGradient(colors: [Color("cubeGrad"),Color("cubeGrad").opacity(0.32),Color("cubeGrad").opacity(0) ], center: .center, startRadius: 1, endRadius: 190)
                                            .blur(radius: 10)
                                            .offset(y: -24)
                                            .mask {
                                                Image("citizenFigure")
                                                    .resizable()
                                                    .blur(radius: 2)
                                                    .scaledToFit()
                                            }
                                    }
                                    .padding()
                                }
                            
                            Rectangle()
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [
                                        Color("magicColor2").opacity(0),
                                        Color("magicColor2"),
                                        Color("magicColor2"),
                                        Color("magicColor2").opacity(0)]),
                                                   startPoint: .leading,
                                                   endPoint: .trailing)
                                )
                                .frame(width: 320, height: 33)
                                .overlay(
                                    Text("CITIZEN")
                                        .font(Font.custom("Roboto-Black", size: 27))
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 4)
                                )
                            
                         
                                .offset(y: geo.size.height/2.8)
                            HStack {
                                Spacer()
                                Rectangle()
                                    .fill(.white)
                                    .frame(width: 40, height: 33)
                                    .overlay(
                                        Text("1")
                                            .font(Font.custom("Roboto-Bold", size: 24)))
                            }
                            .padding(28)
                        }
                       
                        Text("Ordinary townspeople who don't have special abilities. Their main goal is to survive and help identify the Mafia for lynching during the day.")
                            .multilineTextAlignment(.center)
                            .font(Font.custom("Roboto-Medium", size: 18))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 6)
                            .padding(.horizontal, 16)
                            .padding(.bottom, 8)
                    }
                    .background {
                        Color("magicColor")
                            .padding(4)
                    }
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
