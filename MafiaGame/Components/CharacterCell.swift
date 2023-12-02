//
//  CharacterCell.swift
//

import SwiftUI

struct CharacterCell: View {

    let character: CharacterModel
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
                            Image(character.image)
                                .resizable()
                                .scaledToFit()
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
                                    }
                                }
                                .padding()
                                .background {
                                    
                                    ZStack {
                                        RadialGradient(colors: [Color("citizenBg"),.black], center: .center, startRadius: 80, endRadius: 190)
                                        Color("citizenBg").opacity(0.4)
                                        
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
                                        Color("magicColor2").opacity(0),
                                        Color("magicColor2"),
                                        Color("magicColor2"),
                                        Color("magicColor2").opacity(0)]),
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
                            //                                HStack {
                            //                                    Spacer()
                            //                                    Rectangle()
                            //                                        .fill(.white)
                            //                                        .frame(width: 40, height: 33)
                            //                                        .overlay(
                            //                                            Text(character.number)
                            //                                                .font(Font.custom("Roboto-Bold", size: 24)))
                            //                                        .foregroundColor(.black)
                            //                                }
                            //                                .padding(28)
                        }
                        
                        Text(character.description)
                            .multilineTextAlignment(.center)
                            .font(Font.custom("Roboto-Medium", size: 18))
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 6)
                            .padding([.horizontal,.bottom], 16)
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

//struct CharacterCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterCell()
//    }
//}
