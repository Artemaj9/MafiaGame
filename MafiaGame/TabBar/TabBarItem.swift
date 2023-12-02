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
            ZStack(alignment: .bottom) {
                Rectangle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [
                            Color("tbBlue"),
                            Color("tbBurgundy")]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                    )
                    .cornerRadius(3)
                    .shadow(color: Color("tbShadow"), radius: 8, x: 0, y: 0)
                    .frame(width: 75, height: 49)
                    .offset(y: 4)
                    .opacity(tabbarRouter.currentPage == assignedPage ? 1 : 0)
                
                VStack {
                    Image(iconName)
                        .renderingMode(.template)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: width, height: height)
                        .padding(.top, 16)
                    
                    Text(text)
                        .font(Font.custom("Roboto-Medium", size: 12))
                }
            }
            
            Spacer()
        }
        .onTapGesture {
            tabbarRouter.currentPage = assignedPage
        }
        .foregroundColor(tabbarRouter.currentPage == assignedPage ? .white : .black)   
        .animation(.easeOut(duration: 0.4), value: tabbarRouter.currentPage)
    }
}
