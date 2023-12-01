//
//  GameView.swift
//

import SwiftUI

struct GameView: View {
    
    @State private var isDay = false
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                Image(isDay ? "bgday" : "bgnight")
                    .resizable()
                    .ignoresSafeArea()
                    .animation(.easeInOut(duration: 1.5), value: isDay)
                
                VStack {
                    Rectangle()
                        .fill(.white)
                        .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
                        .padding([.leading, .trailing], 12)
                        .frame(height: geo.size.height/10)
                    
                    RoundedRectangle(cornerRadius: 100)
                        .fill(.white)
                        .shadow(color: .black.opacity(0.4), radius: 8, x: 0, y: 0)
                        .frame(width: 70, height: 28)
                        .offset(y: -24)
                        .overlay(
                        Image(systemName: "shevron"))
                        
                    
                    Spacer()
                    
                    Button {
                        isDay.toggle()
                    } label: {
                        Circle()
                            .fill(isDay ? .yellow : .blue)
                            .frame(width: 80)
                        
                            .overlay {
                                Image(isDay ? "sunbtn" : "moonbtn")
                            }
                    }
                }
                .ignoresSafeArea()
            }
            .preferredColorScheme(.light)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
