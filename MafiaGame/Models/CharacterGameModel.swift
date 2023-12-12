//
//  CharacterGameModel.swift
//  MafiaGame
//
//  Created by Artem on 10.12.2023.
//

import Foundation

struct GameCharacterCell: Identifiable {
    
    var id = UUID()
    var image: String
    var name: String = ""
    var type: String {
        switch image {
        case "citizen","doctor", "sheriff", "cop":
            return "citizen"
            
        case "mafia","godfather", "mafioso","framer":
            return "mafia"
            
            
        case "bodyuard","executioner","mistress","jester","vigilante":
            return "neutral"
            
        default:
            return "neutral"
        }
    }
}


