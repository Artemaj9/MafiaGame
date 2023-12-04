//
//  CharacterDetailView.swift
//

import SwiftUI

struct CharacterDetailView: View {
    var body: some View {
          
            ZStack {
                Image("bgnight")
                    .scaleEffect(2, anchor: .top)
                GeometryReader { geo in
                    ScrollView(showsIndicators: false) {
                        Color.clear
                            .frame(width: geo.size.height/10)
                        CharacterCell3(character: CharacterModel(
                            image: "citizen",
                            number: "1",
                            role: "CITIZEN",
                            type: "citizen",
                            description: "", isDescription: false))
                        .frame(width: geo.size.width * 0.95, height: geo.size.height/2)
                        
                        ForEach(1..<5) { _ in
                            DescriptionDetailCell()
                                .shadow(radius: 0.5).opacity(0.64)
                                .frame(width: geo.size.width*0.9)
                        }
                        .offset(y: -geo.size.height/12)
                       
                        
                        Color.clear
                            .frame(height: geo.size.height/8)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
              
                }
                .background {
                    Color("citizenBg").opacity(0.44)
                        .ignoresSafeArea()
                        .padding(.horizontal, 12)
                        .offset(x:5)
                      
                }
                //.background(Color("citizenBg"))
            }
            .offset(x: -5)
        }
    }

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView()
    }
}
