//
//  LogoView.swift
//  MafiaGame
//
//  Created by Artem on 13.12.2023.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Group {
                    Group {
                        Image("draw")
                            .rotationEffect(.degrees(-25))
                            .offset(y: geo.size.height*0.27)
                        
                        Image("draw")
                            .rotationEffect(.degrees(-5))
                            .offset(y: geo.size.height*0.37)
                        Image("draw")
                            .rotationEffect(.degrees(-30))
                            .offset(x: geo.size.height*0.26, y: geo.size.height*0.34)
                        Image("draw")
                            .rotationEffect(.degrees(-50))
                            .offset(x: geo.size.height*0.1, y: geo.size.height*0.44)
                        Image("draw")
                            .rotationEffect(.degrees(-80))
                            .offset(x: geo.size.height*0.25, y: geo.size.height*0.43)
                        Image("draw")
                            .rotationEffect(.degrees(-80))
                            .offset(x: geo.size.height*0.15, y: geo.size.height*0.43)
                        
                        Image("draw")
                            .rotationEffect(.degrees(-30))
                            .offset(x: geo.size.height*0.29, y: geo.size.height*0.29)
                    }
                    .offset(y: geo.size.height/8)
                    .saturation(1.2)
                    
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
                }
                .offset(y: -geo.size.height/12)
                VStack(spacing: -30) {
                    HStack(spacing: 0) {
                        StrokeText(text: "M", width: 4, color: .black)
                            .foregroundColor(Color("whitecity"))
                        StrokeText(text: "afia", width: 4, color: .black)
                            .foregroundColor(.white)
                    }
                    .font(Font.custom("pricedown", size: 98))
                    Group {
                        HStack(spacing: 0) {
                            StrokeText(text: "G", width: 4, color: .black)
                                .foregroundColor(Color("whitecity"))
                            StrokeText(text: "ame", width: 4, color: .black)
                                .foregroundColor(.white)
                        }
                        .font(Font.custom("pricedown", size: 98))
                        HStack(spacing: 0) {
                            StrokeText(text: "M", width: 4, color: .black)
                                .foregroundColor(Color("whitecity"))
                            StrokeText(text: "astery", width: 4, color: .black)
                                .foregroundColor(.white)
                        }
                        .font(Font.custom("pricedown", size: 58))
                    }
                    .offset(y: -18)
                }
                .offset(x: geo.size.width*0.2)
                .offset(y: geo.size.height*0.35)
                
                
                
            }
        }
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
