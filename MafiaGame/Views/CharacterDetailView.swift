//
//  CharacterDetailView.swift
//

import SwiftUI

struct CharacterDetailView: View {
    var body: some View {
          
            ZStack {
                Image("bgnight")
                    .scaleEffect(2, anchor: .center)
                GeometryReader { geo in
                    ScrollView(showsIndicators: false) {
                        Color.clear
                            .frame(height: 24)
                        CharacterCell3(character: CharacterModel(
                            image: "citizen",
                            number: "1",
                            role: "CITIZEN",
                            type: "citizen",
                            description: "", isDescription: false))
                        .frame(width: geo.size.width * 0.95, height: geo.size.height/2.3, alignment: .center)
                        
                        ForEach(1..<5) { _ in
                            DescriptionDetailCell()
                                .shadow(radius: 0.5).opacity(0.64)
                                .frame(width: geo.size.width*0.9)
                        }
                      .offset(y: -12)
                        
                        Color.clear
                            .frame(height: geo.size.height/8)
                    }
                    .onAppear {
                        print(geo.size.height)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
              
                }
                .background {
                    Color("citizenBg").opacity(0.44)
                        //.ignoresSafeArea()
                        .padding(.horizontal, 12)
                        .offset(x:5)
                       // .offset(y: -20)
                      
                }
                //.background(Color("citizenBg"))
            }
            .offset(x: -5)
            .navigationBarHidden(true)
        }
    }

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView()
    }
}
