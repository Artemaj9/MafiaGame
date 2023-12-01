//
//  GameView.swift
//

import SwiftUI

struct GameView: View {
    
    @State private var isDay = false
    
    var body: some View {
        ZStack {
            Image(isDay ? "bgday" : "bgnight")
                .resizable()
                .ignoresSafeArea()
                .animation(.easeInOut(duration: 1.5), value: isDay)
            
            VStack {
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
          //  GeometryReader { geo in
            //    RoundedRectangle(cornerRadius: 10)
                
            //}
        }
                .preferredColorScheme(.dark)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
