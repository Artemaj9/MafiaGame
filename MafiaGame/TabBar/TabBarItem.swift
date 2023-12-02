//
//  TabBarItem.swift
//

import SwiftUI

struct TabItem: View {
    
    let width, height: CGFloat
    let iconName: String
    let text: String
    
    @ObservedObject var tabbarRouter: TabbarRouter
    let assignedPage: Page
    
    var body: some View {
        VStack {
           // Image(tabbarRouter.currentPage == assignedPage ? iconName : iconName + "gr")
            Image(iconName)
                .renderingMode(.template)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 16)
            
            Text(text)
                .font(.caption)
            
            Spacer()
        }
        .foregroundColor(tabbarRouter.currentPage == assignedPage ? .white : .black)
        .onTapGesture {
            tabbarRouter.currentPage = assignedPage
        }
        .animation(.easeOut(duration: 0.4), value: tabbarRouter.currentPage)
    }
}
