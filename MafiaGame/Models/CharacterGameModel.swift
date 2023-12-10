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
}
