//
//  CityView.swift
//

import SwiftUI

struct CityView: View {
    
    
    let characters = [
        CharacterModel(image: "citizen", number: "1", role: "CITIZEN", description:
    "Ordinary townspeople who don't have special abilities. Their main goal is to survive and help identify the Mafia for lynching during the day."),
        CharacterModel(image: "doctor", number: "2", role: "DOCTOR", description:
    "Can protect other players from being eliminated by the Mafia at night. Typically they cannot protect the same person two nights in a row."),
        
                                  ]
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ScrollView {
                Text("Characters")
                    .font(Font.custom("Roboto-Bold", size: 33))
                    .foregroundColor(Color("cityTitle"))
                    .shadow(color: .white, radius: 2)
               
                VStack {
                    ForEach(characters, id: \.self) { character in
                        CharacterCell(character: character)
                            .frame(height: 500)
                    }
                }
            
            }
            
        }
        .preferredColorScheme(.dark)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView()
    }
}
