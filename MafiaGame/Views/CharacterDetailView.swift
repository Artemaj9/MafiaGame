//
//  CharacterDetailView.swift
//

import SwiftUI

struct CharacterDetailView: View {
   
    @Environment(\.presentationMode) var presentation
    var num: Int = 2
    var body: some View {
          
            ZStack {
                Image("bgnight")
                    .scaleEffect(2, anchor: .leading)
                    .offset(x: -24)
                GeometryReader { geo in
                    ScrollView(showsIndicators: false) {
                        Color.clear
                            .frame(height: 24)
                        CharacterCell3(character: CharacterModel(
                            image: allCharacters[num - 1].image,
                            number: String(num),
                            role: allCharacters[num - 1].title,
                            type: allCharacters[num - 1].team.rawValue,
                            description: "", isDescription: false), presentationMode: presentation)
                        .frame(width: geo.size.width * 0.95, height: geo.size.height/2.3, alignment: .center)
                        
                        ForEach(allCharacters[num - 1].descriptionArray, id:\.0) { (title, info) in
                            DescriptionDetailCell(title: title , information: info)
                                .shadow(radius: 0.5).opacity(0.64)
                                .frame(width: geo.size.width * 0.9)
                               
                        }
                        .frame(width: geo.size.width * 0.9)
                        .fixedSize(horizontal: true, vertical: false)
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
                        .offset(x: 5)
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
