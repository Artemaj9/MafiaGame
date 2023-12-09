//
//  HelpView.swift
//  MafiaGame
//
//  Created by Artem on 02.12.2023.
//

import SwiftUI

struct HelpView: View {
    @StateObject var vm = GameViewModel()
    var body: some View {
        
        if !vm.onboardingHasShown {
            AIOnboardingView(vm: vm)
        } else {
            HomeView()
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
