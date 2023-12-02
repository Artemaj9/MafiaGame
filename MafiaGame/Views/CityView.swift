//
//  CityView.swift
//

import SwiftUI

struct CityView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Color("magicColor")
            GeometryReader { geo in
                ZStack {
                    Image("citizen")
                        .resizable()
                        .scaledToFit()
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
                        .offset(y: geo.size.height/6)  // придумать универсальный сдвиг
                  
                            Rectangle()
                                .fill(.white)
                                .frame(width: 40, height: 33)
                                .overlay(
                                    Text("1")
                                        .font(Font.custom("Roboto-Bold", size: 24)))
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
