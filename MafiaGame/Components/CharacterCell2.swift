//
//  CharacterCell2.swift
//

import SwiftUI

struct CharacterCell2: View {

    let character: CharacterModel
    var myGradient = Gradient(
        colors: [
            Color("strokeGrad4"),
            Color("strokeGrad3"),
            Color("strokeGrad2")
        ]
    )
    var isDescription = true
   // @State var isDescription = true
    var body: some View {
            ZStack {
               
                GeometryReader { geo in
                    VStack() {
                        ZStack(alignment: .top) {
                            Image(character.image)
                                .resizable()
                                .scaledToFill()
                                .overlay {
                                    ZStack(alignment: .top) {
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
                                }
                                .padding()
                                .background {

                                    ZStack {
                                        Color.black
                                        RadialGradient(colors: [Color(character.type + "Bg"),.black], center: .center, startRadius: 80, endRadius: 190)
                                        Color(character.type + "Bg").opacity(0.4)

                                        RadialGradient(colors: [.black.opacity(0),.black.opacity(0.3) ], center: .center, startRadius: 10, endRadius: 90)
                                            .mask {
                                                Image(character.image + "Rays")
                                                    .resizable()
                                                    .scaledToFit()

                                            }

                                        RadialGradient(colors: [Color("cubeGrad"),Color("cubeGrad").opacity(0.32),Color("cubeGrad").opacity(0) ], center: .center, startRadius: 1, endRadius: 190)
                                            .blur(radius: 10)
                                            .offset(y: -24)
                                            .mask {
                                                Image(character.image + "Figure")
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
                                        Color(character.type + "Color2").opacity(0),
                                        Color(character.type + "Color2"),
                                        Color(character.type + "Color2"),
                                        Color(character.type + "Color2").opacity(0)]),
                                                   startPoint: .leading,
                                                   endPoint: .trailing)
                                )
                                .frame(width: geo.size.width*0.7, height: geo.size.height/10)
                                //.frame(width: 120, height: 33)
                                .overlay(
                                    Text(character.role)
                                        .font(Font.custom("Roboto-Black", size: 12))
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 4)
                                )
                                .offset(y: 0.7 * geo.size.width)
                        }
                    }
                    //.frame(maxWidth: .infinity)
                  //  .background {
                    //    Color(character.type + "Color")
                      //      .padding(4)
                    //}
                }
            }
    }
}

#warning("цвет фона карточек надо поправлять!")
