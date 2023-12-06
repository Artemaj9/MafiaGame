//
//  CharInfoModel.swift
//

import Foundation

struct CharInfoModel {
    let descriptionArray = [(String, String)]()
}

struct Character: Hashable {
    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.title == rhs.title
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(num)
        hasher.combine(title)
    }
    
    let image: String
    let title: String
    let team: Team
    let num: Int
    let descriptionArray: [(String, String)]
    let description: String?
}

enum Team: String {
    case citizen
    case mafia
    case neutral
}
 // MOCKDATA:
let allCharacters: [Character] = [
    Character(image: "citizen", title: "CITIZEN", team: .citizen, num: 1, descriptionArray: [
        ("Role", "Citizens are ordinary townspeople. Their goal is to survive and identify the Mafia for lynching during the day."),
        ("Abilities", "They don't possess special abilities, but they participate in discussions and vote during the day to decide who to lynch."),
        ("Number of Players", "This varies based on the number of special roles and Mafia in the game. Usually, about half of the total players are Citizens."),
        ("Status", "Classic (Citizens are always in the game)."),
        ("Limit", "No strict limit, but typically half the players in a game are Citizens.")],
              description:
                "Ordinary townspeople who don't have special abilities. Their main goal is to survive and help identify the Mafia for lynching during the day."),
    
    Character(image: "doctor", title: "DOCTOR", team: .citizen, num: 2, descriptionArray: [
        ("Role", "The Doctor is a Citizen who has the power to protect other players from being eliminated by the Mafia at night."),
        ("Abilities", "During the night phase, the Doctor chooses one player to protect. If the Mafia or another harmful role targets this player, they will survive."),
        ("Number of Players", "There's typically one Doctor in a standard game. In larger games, there can be more than one."),
        ("Status", "Common (The Doctor is often included in the game, but not as consistently as the Mafia and Citizens)."),
        ("Limit", "Usually 1-2 Doctors in a game to maintain balance.")],
              description:
                "Ordinary townspeople who don't have special abilities. Their main goal is to survive and help identify the Mafia for lynching during the day."),
    
    Character(image: "sheriff", title: "SHERIFF", team: .citizen, num: 3, descriptionArray: [
        ("Role", "The Sheriff is a variant of the Detective. Their role is to investigate other players to find out if they are suspicious (Mafia or Serial Killer) or not."),
        ("Abilities", "Each night, the Sheriff can investigate one player to find out if they are a Mafia member or a Serial Killer."),
        ("Number of Players", "Typically, there is only one Sheriff in a game."),
        ("Status", "Rare (Usually included in larger or more complex games as an additional investigative role)."),
        ("Limit", "Usually 1 Sheriff in a game to maintain balance.")],
              description:
                "Ordinary townspeople who don't have special abilities. Their main goal is to survive and help identify the Mafia for lynching during the day."),
    
    Character(image: "cop", title: "COP", team: .citizen, num: 4, descriptionArray: [
        ("Role", "The Detective, also known as the Cop, is a Citizen who can investigate other players to determine their roles."),
        ("Abilities", "During the night phase, the Detective chooses one player to investigate and learns whether they are a Citizen or a member of the Mafia."),
        ("Number of Players", "There's typically one Detective in a standard game. In larger games, there can be more than one."),
        ("Status", "Common (The Detective is often included in the game, but not as consistently as the Mafia and Citizens)."),
        ("Limit", "Usually 1-2 Detectives in a game to maintain balance.")],
              description:
                "Ordinary townspeople who don't have special abilities. Their main goal is to survive and help identify the Mafia for lynching during the day."),
    
    Character(image: "mafia", title: "MAFIA", team: .mafia, num: 5, descriptionArray: [
        ("Role", "The Mafia members are the main antagonists of the game. They conspire to eliminate the Citizens while remaining hidden."),
        ("Abilities", "They secretly confer during the night phase to select a Citizen to eliminate. They work together to deceive the other players during the day."),
        ("Number of Players", "A game typically requires at least 2 Mafia members to begin. In a standard game of 8, there are usually 2 Mafia members. In larger games, approximately a third of the players can be part of the Mafia."),
        ("Status", "Classic (The Mafia is always in the game)."),
        ("Limit", "No strict limit, but to maintain balance, the number of Mafia members shouldn't exceed a third of the total players.")],
              description:
                "Ordinary townspeople who don't have special abilities. Their main goal is to survive and help identify the Mafia for lynching during the day."),
    
    Character(image: "godfather", title: "GODFATHER", team: .mafia, num: 6, descriptionArray: [
        ("Role", "The Godfather is the leader of the Mafia. Their goal is to eliminate the Citizens and take control of the town."),
        ("Abilities", "The Godfather chooses a player to kill each night. If there is no Mafioso, the Godfather will carry out the killing. The Godfather appears innocent to the Detective's investigation and is immune to being killed at night."),
        ("Number of Players", "Typically, there is only one Godfather in a game."),
        ("Status", "Rare (Usually included in larger or more complex games with a bigger Mafia team)."),
        ("Limit", "Usually 1 Godfather in a game to maintain balance.")],
              description:
                "Ordinary townspeople who don't have special abilities. Their main goal is to survive and help identify the Mafia for lynching during the day."),
 
    Character(image: "mafioso", title: "MAFIOSO", team: .mafia, num: 7, descriptionArray: [
        ("Role", "The Mafioso is a member of the Mafia who carries out the killing chosen by the Godfather."),
        ("Abilities", "The Mafioso kills the target chosen by the Godfather each night. If the Godfather dies or is role-blocked, the Mafioso will make the decision on who to kill."),
        ("Number of Players", "In games where there is a Godfather, there's typically also one Mafioso."),
        ("Status", "Rare (Usually included in larger or more complex games with a bigger Mafia team)."),
        ("Limit", "Usually 1 Mafioso in a game to maintain balance.")],
              description:
                "Ordinary townspeople who don't have special abilities. Their main goal is to survive and help identify the Mafia for lynching during the day."),
    
    Character(image: "framer", title: "FRAMER", team: .mafia, num: 8, descriptionArray: [
                    ("Role", "The Framer is a member of the Mafia who can make other players appear guilty."),
                    ("Abilities", "The Framer chooses a player to frame each night. If the Detective investigates this player, they will appear as Mafia."),
                    ("Number of Players", "Typically, there is only one Framer in a game."),
                    ("Status", "Rare (Usually included in larger or more complex games with a bigger Mafia team)."),
                    ("Limit", "Usually 1 Framer in a game to maintain balance.")],
                          description:
                            "Ordinary townspeople who don't have special abilities. Their main goal is to survive and help identify the Mafia for lynching during the day."),
    
    Character(image: "bodyguard", title: "BODYGUARD", team: .neutral, num: 9, descriptionArray: [
                    ("Role", "The Bodyguard can protect a player from attacks at night. They are a citizen."),
                    ("Abilities", "Each night, the Bodyguard can choose one player to protect. If their protected player is attacked, the Bodyguard and the attacker die instead."),
                    ("Number of Players", "Typically, there is only one Bodyguard in a game."),
                    ("Status", "Rare (Usually included in larger or more complex games as an additional protective role)."),
                    ("Limit", "Usually 1 Bodyguard in a game to maintain balance.")],
                          description:
                            "Ordinary townspeople who don't have special abilities. Their main goal is to survive and help identify the Mafia for lynching during the day."),
    
    Character(image: "executioner", title: "EXECUTIONER", team: .neutral, num: 10, descriptionArray: [
                    ("Role", "The Executioner's goal is to get a specific person lynched. They are a neutral role."),
                    ("Abilities", "The Executioner doesn't have night abilities. Their goal is achieved through manipulation and persuasion during the day."),
                    ("Number of Players", "Typically, there is only one Executioner in a game."),
                    ("Status", "Rare (Usually included in larger or more complex games)."),
                    ("Limit", "Usually 1 Executioner in a game to maintain balance.")],
                          description:
                            "Ordinary townspeople who don't have special abilities. Their main goal is to survive and help identify the Mafia for lynching during the day."),
    
    Character(image: "mistress", title: "MISTRESS", team: .neutral, num: 11, descriptionArray: [
                    ("Role", "The Escort/Mistress is a citizen who can distract players each night, preventing them from using their ability."),
                    ("Abilities", "Each night, the Escort/Mistress can choose one player to role block, which prevents that player from using their ability."),
                    ("Number of Players", "Typically, there is only one Escort/Mistress in a game."),
                    ("Status", "Rare (Usually included in larger or more complex games as a disruptive role)."),
                    ("Limit", "Usually 1 Escort/Mistress in a game to maintain balance.")],
                          description:
                            "Ordinary townspeople who don't have special abilities. Their main goal is to survive and help identify the Mafia for lynching during the day."),
    
    Character(image: "jester", title: "JESTER", team: .neutral, num: 12, descriptionArray: [
                    ("Role", "The Jester is a neutral role whose goal is to trick the town into lynching them during the day."),
                    ("Abilities", "They have no special abilities at night but use manipulation during the day to appear guilty."),
                    ("Number of Players", "Typically, there is only one Jester in a game."),
                    ("Status", "Uncommon (Usually included in larger or more complex games)."),
                    ("Limit", "Usually 1 Jester in a game to maintain balance.")],
                          description:
                            "Ordinary townspeople who don't have special abilities. Their main goal is to survive and help identify the Mafia for lynching during the day."),
    
    Character(image: "vigilante", title: "VIGILANTE", team: .neutral, num: 13, descriptionArray: [
                    ("Role", "The Vigilante is a Citizen who takes matters into their own hands. They have the ability to kill other players at night."),
                    ("Abilities", "During the night phase, the Vigilante can choose to kill a player. This power is typically limited to 1-3 uses."),
                    ("Number of Players", "There's typically one Vigilante in a larger game. They aren't usually included in smaller, standard games."),
                    ("Status", "Uncommon (The Vigilante isn't as commonly included as the previous roles)."),
                    ("Limit", "Usually 1 Vigilante in a game to maintain balance.")],
                          description:
                            "Ordinary townspeople who don't have special abilities. Their main goal is to survive and help identify the Mafia for lynching during the day."),
    
    Character(image: "skiller", title: "SERIAL KILLER", team: .neutral, num: 14, descriptionArray: [
                    ("Role", "The Serial Killer is an independent role that tries to be the last one standing. They do this by eliminating one player every night."),
                    ("Abilities", "They choose a player to kill each night. They're immune to being killed at night, but can be lynched during the day."),
                    ("Number of Players", "Typically, there is only one Serial Killer in a game."),
                    ("Status", "Uncommon (Usually included in larger or more complex games)."),
                    ("Limit", "Usually 1 Serial Killer in a game to maintain balance.")],
                          description:
                            "Ordinary townspeople who don't have special abilities. Their main goal is to survive and help identify the Mafia for lynching during the day.")
    ]
