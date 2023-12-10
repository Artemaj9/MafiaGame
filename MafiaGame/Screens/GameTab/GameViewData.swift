//
//  GameViewData.swift
//  MafiaGame
//
//  Created by Artem on 10.12.2023.
//

import SwiftUI

let characters = [
    CharacterModel(image: "citizen", number: "1", role: "CITIZEN", type: "citizen", description:
"Ordinary townspeople who don't have special abilities. Their main goal is to survive and help identify the Mafia for lynching during the day.", isDescription: false),
    
    CharacterModel(image: "doctor", number: "2", role: "DOCTOR", type: "citizen", description:
"Can protect other players from being eliminated by the Mafia at night. Typically they cannot protect the same person two nights in a row.", isDescription: false),
    
    CharacterModel(image: "sheriff", number: "3", role: "SHERIFF", type: "citizen", description:
"A variant of the Detective. They can investigate other players to find out if they are suspicious (Mafia or Serial Killer) or not.", isDescription: false),
    
    CharacterModel(image: "cop", number: "4", role: "COP", type: "citizen", description:
"Can investigate other players to determine their roles. They play a crucial role in guiding the citizens to make the right decisions.", isDescription: false),
    
    CharacterModel(image: "mafia", number: "5", role: "MAFIA",  type: "mafia", description:
"The main antagonists who secretly eliminate citizens at night. They know each other's identity and conspire to deceive the town during the day.", isDescription: false),
    CharacterModel(image: "godfather", number: "6", role: "GODFATHER", type: "mafia", description:
"The leader of the Mafia. Appears as a Citizen when investigated by the Detective. Immune to the Vigilante's attack.", isDescription: false),
    CharacterModel(image: "mafioso", number: "7", role: "MAFIOSO", type: "mafia", description:
"A member of the Mafia who carries out the killing. If no Mafioso is present, the Godfather will carry out the kill.", isDescription: false),
    CharacterModel(image: "framer", number: "8", role: "FRAMER", type: "mafia", description:
"A Mafia role that can frame other players, causing them to appear as Mafia when investigated by the Detective.", isDescription: false),
    CharacterModel(image: "bodyguard", number: "9", role: "BODYGUARD", type: "neutral", description:
"Can protect a player from attacks at night. If their protected player is attacked, the Bodyguard and the attacker die instead.", isDescription: false),
    CharacterModel(image: "executioner", number: "10", role: "EXECUTIONER", type: "neutral", description:
"Their goal is to get a specific person lynched. If that person dies at night or survives the game, the Executioner becomes a Jester.", isDescription: false),
    CharacterModel(image: "mistress", number: "11", role: "MISTRESS", type: "neutral", description:
"Can distract a player each night, blocking them from using their ability.", isDescription: false),
    CharacterModel(image: "jester", number: "12", role: "JESTER", type: "neutral", description:
"Their goal is to trick the town into lynching them. If they are killed at night or survive the game, they lose.", isDescription: false),
    CharacterModel(image: "vigilante", number: "13", role: "VIGILANTE", type: "neutral", description:
"A citizen who can choose to kill other players at night. Their ability is usually limited to a certain number of uses. They need to use this power wisely to not accidentally eliminate innocent citizens.", isDescription: false),
    CharacterModel(image: "skiller", number: "14", role: "SERIAL KILLER", type: "neutral", description:
"An independent role that tries to be the last one standing by killing one player every night. Not aligned with either the Mafia or the Citizens.", isDescription: false)
]


let dayGradient =  LinearGradient(stops: [
    .init(color: Color("timergrad1"), location: 0.1),
    .init(color: Color("timergrad2"), location: 0.4),
    .init(color: Color("timergrad3"), location: 0.85),
   .init(color:
    Color("timergrad4"), location: 0.98)
],
               startPoint: .trailing,
               endPoint:
        .bottomLeading
)


let nightGradient =  LinearGradient(stops: [
    .init(color: Color("nightgrad1"), location: 0.1),
    .init(color: Color("nightgrad2"), location: 0.4),
    .init(color: Color("nightgrad3"), location: 0.85),
    .init(color:
            Color("nightgrad4"), location: 0.98)
],
                                    startPoint: .trailing,
                                    endPoint:
        .bottomLeading
)

let columns: [GridItem] = [
    GridItem(.flexible(), spacing: -16, alignment: nil),
    GridItem(.flexible(), spacing: -16, alignment: nil),
    GridItem(.flexible(), spacing: -16, alignment: nil)
]
