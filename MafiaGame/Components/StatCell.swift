//
//  StatCell.swift
//

import SwiftUI

struct StatCell: View {
    
    var mainColor: String
    var bgColor: String
    var shadowColor: String
    var value: String
    var icon: String
    
    var body: some View {
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color(bgColor))
                    .frame(width: 81, height: 36)
                    .shadow(color: Color(shadowColor), radius: 4)
                    .overlay {
                        Text(value)
                            .font(Font.custom("Roboto-Medium", size: 18))
                            .foregroundColor(.white)
                            .offset(x: 16)
                            .shadow(color: .black, radius: 4)
                    }
                
                Rectangle()
                    .fill(Color(mainColor))
                    .innerShadow(color: .black.opacity(0.64), radius: 0.1)
                    .frame(width: 36, height: 36)
                    .overlay {
                        Image(icon)
                    }
            }
    }
}
