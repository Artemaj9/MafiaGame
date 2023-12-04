//
//  CharacterDetailView.swift
//

import SwiftUI

struct CharacterDetailView: View {
    var body: some View {
          
            ZStack {
                Image("bgnight")
                    .scaleEffect(2)
                GeometryReader { geo in
                    ScrollView(showsIndicators: false) {
                        CharacterCell(character: CharacterModel(
                            image: "citizen",
                            number: "1",
                            role: "CITIZEN",
                            type: "citizen",
                            description: "", isDescription: false))
                        .frame(width: geo.size.width, height: geo.size.height/2)
                        
                        ForEach(1..<5) { _ in
                            DescriptionDetailCell()
                                .shadow(radius: 0.5).opacity(0.64)
                        }
                        
                        Color.clear
                            .frame(height: geo.size.height/8)
                    }
                    .padding(.top, 16)
                }
                //.background(Color("citizenBg"))
            }
        }
    }

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView()
    }
}
