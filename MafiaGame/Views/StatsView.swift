//
//  StatsView.swift
//

import SwiftUI

struct StatsView: View {
    @ObservedObject var vm: GameControlModel
    @Binding var busted: Int
    
    var body: some View {
        HStack {
            StatCell(mainColor: "mainSkull", bgColor: "bgSkull", shadowColor: "shadowSkull", value: String(busted), icon: "skull")
            
            Spacer()
            
            StatCell(mainColor: "mainSmile", bgColor: "bgSmile", shadowColor: "shadowSmile", value: String(vm.selectedCharacters.filter{$0.type == "citizen"}.count), icon: "smile")
            
            Spacer()
            
            StatCell(mainColor: "mainUsers", bgColor: "bgUsers", shadowColor: "shadowUsers", value: String(vm.selectedCharacters.count), icon: "group")
        }
        .padding(12)
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(vm: GameControlModel(), busted: .constant(0))
    }
}

// hzz
func getTeamCount(characters: [String],in team: [String]) -> Int {
    var count = 0
    for ch in characters {
        if team.contains(ch) {
            count += 1
            
        }
    }
    return count
}
