//
//  DescriptionDetailCell.swift
//

import SwiftUI

struct DescriptionDetailCell: View {
    var title: String = "ROLE"
    var information: String = "Citizens are ordinary townspeople. Their goal is to survive and identify the Mafia for lynching during the day."
    let myGradient = Gradient(
        colors: [
            Color("strokeGrad4"),
            Color("strokeGrad3"),
            Color("strokeGrad2")
        ]
    )
    var body: some View {
        ZStack {
                VStack {
                    Text(title)
                        .font(Font.custom("Roboto-Bold", size: 21))
                        .foregroundColor(.white)
                        .shadow(color: .white, radius: 1.3)
                        .padding(.vertical, 1)
                        .padding(.top, 4)
                    Text(information)
                        .font(Font.custom("Roboto-Regular", size: 18))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 6)
                        .padding(.horizontal, 24)
                        .frame(width: UIScreen.main.bounds.width*0.9)
                }
                .background {
                    Color("infoBg")
                }
                .overlay {
                    ZStack(alignment: .top) {
                        Rectangle()
                            .stroke(
                                LinearGradient(
                                    gradient: myGradient,
                                    startPoint: .bottom,
                                    endPoint: .top
                                ),
                                lineWidth: 6
                            )
                            .cornerRadius(1)
                    }
                }
                .shadow(color: .black.opacity(0.64), radius: 2)
            }
        }
}

struct DescriptionDetailCell_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionDetailCell()
    }
}
