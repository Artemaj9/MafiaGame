//
//  TabBarItem.swift
//

import SwiftUI

struct TabItem: View {
    
    let width, height: CGFloat
    let model: TabModel
//    let iconName: String
//    let text: String
//    let assignedPage: Page
    
    @ObservedObject var tabbarRouter: TabbarRouter
    
    var body: some View {
        VStack {
            Image(model.iconname)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 16)
            
            Text(model.text)
                .font(Font.custom("Roboto-Medium", size: 12))
            
            Spacer()
        }
        .onTapGesture {
            tabbarRouter.currentPage = model.assignedPage
        }
        .foregroundColor(tabbarRouter.currentPage == model.assignedPage ? .white : .black)
        .animation(.easeOut(duration: 0.4), value: tabbarRouter.currentPage)
    }
}
