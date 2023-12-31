//
//  TabBar.swift
//

import SwiftUI

struct TabBar: View {
    
    @StateObject var tabbarRouter = TabbarRouter()
    @EnvironmentObject var gameCharacterData: GameControlModel
    @Namespace private var namespace
    @State var localSelection: Page = .city

    let tabs = [
        TabModel(iconname: "tbGame", text: "Game", assignedPage: .game),
        TabModel(iconname: "tbCity", text: "City", assignedPage: .city),
        TabModel(iconname: "tbHelp", text: "Help", assignedPage: .help)
    ]
    
    @ViewBuilder
    var contentView: some View {
        switch tabbarRouter.currentPage {
        case .game:
            
            if gameCharacterData.endGame == 1 {
                GreenWinsView()
                    .ignoresSafeArea()
                    .environmentObject(gameCharacterData)
                    .environmentObject(tabbarRouter)
            } else if gameCharacterData.endGame == -1 {
                
                MafiaWinsView()
                    .ignoresSafeArea()
                    .environmentObject(gameCharacterData)
                    .environmentObject(tabbarRouter)
            } else {
                
                GameView()
                    .environmentObject(gameCharacterData)
                    .environmentObject(tabbarRouter)
            }
            
        case .city:
            CityView()
                .environmentObject(tabbarRouter)
            
        case .help:
            HelpView()
                .environmentObject(tabbarRouter)
        }
    }
    
    init() { UITextField.appearance().keyboardAppearance = .light }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                contentView
                    .animation(.easeIn, value: tabbarRouter.currentPage)
                VStack {
                    Spacer()
                    
                    HStack {
                        ForEach(tabs, id:\.self) { tab in
                            TabItem(width: geometry.size.width / 3,
                                    height: geometry.size.height / 40,
                                    model: tab,
                                    tabbarRouter: tabbarRouter)
                            .background(
                                ZStack(alignment: .top) {
                                    if localSelection == tab.assignedPage {
                                        Rectangle()
                                            .fill(
                                                LinearGradient(gradient: Gradient(colors: [
                                                    Color("tbBlue"),
                                                    Color("tbBurgundy")]),
                                                               startPoint: .topLeading,
                                                               endPoint: .bottomTrailing)
                                            )
                                            .matchedGeometryEffect(id: "bg", in: namespace, properties: .frame)
                                            .cornerRadius(3)
                                            .shadow(color: Color("tbShadow"), radius: 8, x: 0, y: 0)
                                            .frame(width: 75, height: 49)
                                            .offset(y: geometry.size.height > 800 ?  -14 : -10)
                                    }
                                }
                            )
                        }
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height / 8)
                    .background( .white.opacity(tabbarRouter.currentPage == .city ? 0.95 : 1))
                    .animation(.easeInOut, value: tabbarRouter.currentPage)
                }
                .onChange(of: tabbarRouter.currentPage, perform: { value in
                    withAnimation(.easeInOut(duration: 0.3)) {
                        localSelection = value
                    }
                })
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
