//
//  AvatarView.swift
//  MafiaGame
//
//  Created by Artem on 06.12.2023.
//

import SwiftUI

struct AvatarView: View {
    let isAI : Bool
    var body: some View {
        ZStack {
            Rectangle()
                .fill(isAI ? .black : .white)
            
            Rectangle()
                .fill(
                    LinearGradient(gradient: Gradient(colors: [
                        Color("tbBlue"),
                        Color("tbBurgundy")]),
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                    
                )
                .saturation(1.4)
                .mask({
                    Image(isAI ? "brain" : "user")
                        .scaleEffect(1.4)
                })
        }
    }
}

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(isAI: false)
    }
}
