//
//  TabBar.swift
//

import SwiftUI

struct TabBar: View {
    
    @StateObject var tabbarRouter = TabbarRouter()
    @State private var inputImage: UIImage?
    
    @ViewBuilder
    var contentView: some View {
        switch tabbarRouter.currentPage {
        case .game:
            GameView()
                .environmentObject(tabbarRouter)
        case .city:
            CityView()
                .environmentObject(tabbarRouter)
        case .help:
            HelpView()
                .environmentObject(tabbarRouter)
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                contentView
                VStack {
                    Spacer()
                    HStack {
                        TabItem(width: geometry.size.width / 3, height: geometry.size.height / 40, iconName: "tbGame" ,text: "Game", tabbarRouter: tabbarRouter, assignedPage: .game)
                        
                        TabItem(width: geometry.size.width / 3, height: geometry.size.height / 40, iconName: "tbCity", text: "City", tabbarRouter: tabbarRouter, assignedPage: .city)
                        
                        TabItem(width: geometry.size.width / 3, height: geometry.size.height / 40, iconName: "tbHelp", text: "Help", tabbarRouter: tabbarRouter, assignedPage: .help)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height / 8)
                    .background(Color("tabBarBackground2"))
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
