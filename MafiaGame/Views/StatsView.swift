//
//  StatsView.swift
//

import SwiftUI

struct StatsView: View {
    @ObservedObject var vm: GameCharacterData
    var body: some View {
        HStack {
            StatCell(mainColor: "mainSkull", bgColor: "bgSkull", shadowColor: "shadowSkull", value: "0", icon: "skull")
            
            Spacer()
            
            StatCell(mainColor: "mainSmile", bgColor: "bgSmile", shadowColor: "shadowSmile", value: "0", icon: "smile")
            
            Spacer()
            
            StatCell(mainColor: "mainUsers", bgColor: "bgUsers", shadowColor: "shadowUsers", value: String(vm.selectedCharacters.count), icon: "group")
        }
        .padding(12)
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView(vm: GameCharacterData())
    }
}
