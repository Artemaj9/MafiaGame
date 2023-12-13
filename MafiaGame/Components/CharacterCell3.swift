//
//  CharacterCell3.swift
//  

import SwiftUI

struct CharacterCell3: View {

    let character: CharacterModel
    let myGradient = Gradient(
        colors: [
            Color("strokeGrad4"),
            Color("strokeGrad3"),
            Color("strokeGrad2")
        ]
    )

    var isDescription = true
    @Binding var presentationMode : PresentationMode
    var body: some View {
            ZStack {
                GeometryReader { geo in
                    VStack() {
                        ZStack(alignment: .top) {
                            Image(character.image)
                                .resizable()
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
                                        HStack {
                                            Rectangle()
                                                .fill(.white)
                                                .frame(width: 33, height: 33)
                                                .overlay(
                                                    Image("x"))
                                                .onTapGesture {
                                                    DispatchQueue.main.async {
                                                        presentationMode.dismiss()
                                                    }
                                                }
                                            Spacer()
                                            Rectangle()
                                                .fill(.white)
                                                .frame(width: 40, height: 33)
                                                .overlay(
                                                    Text(character.number)
                                                        .font(Font.custom("Roboto-Bold", size: 24)))
                                                .foregroundColor(.black)
                                        }
                                        .padding(12)
                                        .offset(y: 4)
                                    }
                                }
                                .padding()
                                .background {
                                    
                                    ZStack {
                                        RadialGradient(colors: [Color(character.type + "Bg"),.black], center: .center, startRadius: 80, endRadius: 190)
                                        Color(character.type + "Bg").opacity(0.4)
                                        
                                        RadialGradient(colors: [.black.opacity(0),.black.opacity(0.3) ], center: .center, startRadius: 10, endRadius: 90)
                                            .mask {
                                                if character.image != "cop" {
                                                    Image("rays")
                                                        .resizable()
                                                        .scaledToFit()
                                                }
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
                                .frame(width: 320, height: 33)
                                .overlay(
                                    Text(character.role)
                                        .font(Font.custom("Roboto-Black", size: 27))
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 4)
                                )
                                .offset(y: 0.75 * geo.size.width)
                        }
                    }
                    .frame(maxWidth: geo.size.width)
                }
        }
    }
}
