//
//  CityView.swift
//

import SwiftUI

struct CityView: View {
    
    
    let characters = [
        CharacterModel(image: "citizen", number: "1", role: "CITIZEN", type: "citizen", description:
    "Ordinary townspeople who don't have special abilities. Their main goal is to survive and help identify the Mafia for lynching during the day."),
        CharacterModel(image: "doctor", number: "2", role: "DOCTOR", type: "citizen", description:
    "Can protect other players from being eliminated by the Mafia at night. Typically they cannot protect the same person two nights in a row."),
        CharacterModel(image: "sheriff", number: "3", role: "SHERIFF", type: "citizen", description:
    "A variant of the Detective. They can investigate other players to find out if they are suspicious (Mafia or Serial Killer) or not."),
        CharacterModel(image: "cop", number: "4", role: "COP", type: "citizen", description:
    "Can investigate other players to determine their roles. They play a crucial role in guiding the citizens to make the right decisions."),
        CharacterModel(image: "mafia", number: "5", role: "MAFIA",  type: "mafia", description:
    "The main antagonists who secretly eliminate citizens at night. They know each other's identity and conspire to deceive the town during the day."),
        CharacterModel(image: "godfather", number: "6", role: "GODFATHER", type: "mafia", description:
    "The leader of the Mafia. Appears as a Citizen when investigated by the Detective. Immune to the Vigilante's attack."),
        CharacterModel(image: "mafioso", number: "7", role: "MAFIOSO", type: "mafia", description:
    "A member of the Mafia who carries out the killing. If no Mafioso is present, the Godfather will carry out the kill."),
        CharacterModel(image: "framer", number: "8", role: "FRAMER", type: "mafia", description:
    "A Mafia role that can frame other players, causing them to appear as Mafia when investigated by the Detective."),
        CharacterModel(image: "bodyguard", number: "9", role: "BODYGUARD", type: "neutral", description:
    "Can protect a player from attacks at night. If their protected player is attacked, the Bodyguard and the attacker die instead."),
        CharacterModel(image: "executioner", number: "10", role: "EXECUTIONER", type: "neutral", description:
    "Their goal is to get a specific person lynched. If that person dies at night or survives the game, the Executioner becomes a Jester."),
        CharacterModel(image: "mistress", number: "11", role: "MISTRESS", type: "neutral", description:
    "Can distract a player each night, blocking them from using their ability."),
        CharacterModel(image: "jester", number: "12", role: "JESTER", type: "neutral", description:
    "Their goal is to trick the town into lynching them. If they are killed at night or survive the game, they lose."),
        CharacterModel(image: "vigilante", number: "13", role: "VIGILANTE", type: "neutral", description:
    "A citizen who can choose to kill other players at night. Their ability is usually limited to a certain number of uses. They need to use this power wisely to not accidentally eliminate innocent citizens."),
        CharacterModel(image: "skiller", number: "14", role: "SERIAL KILLER", type: "neutral", description:
    "An independent role that tries to be the last one standing by killing one player every night. Not aligned with either the Mafia or the Citizens."),
        
        
        
        
                                  ]
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ScrollView {
                Text("Characters")
                    .font(Font.custom("Roboto-Bold", size: 33))
                    .foregroundColor(Color("cityTitle"))
                    .shadow(color: .white, radius: 2)
               
                VStack() {
                    ForEach(characters, id: \.self) { character in
                        CharacterCell(character: character)
                            .frame(minHeight: 450, idealHeight: 500, maxHeight: 550, alignment: .center
                            )
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
