//
//  TimerView.swift
//  MafiaGame
//
//  Created by Artem on 08.12.2023.
//

import SwiftUI

struct TimerView: View {
    @State var showAlert = false
    @Binding var remainingTime: Int
    
    var body: some View {
       
      
        StarView.overlay(OverlayView.mask(StarView))//.overlay(PercentView)
          //  .padding(.horizontal)
        }

    private var StarView: some View {
        Rectangle()
            .cornerRadius(100)
            .foregroundColor(Color.white)
            .frame(height: 80)
    }
    

    
    private var OverlayView: some View {
       GeometryReader { geometry in
            ZStack(alignment: .leading) {
               Rectangle()
                    .fill(
                        LinearGradient(stops: [
                            .init(color: Color("timergrad1"), location: 0.1),
                            .init(color: Color("timergrad2"), location: 0.4),
                            .init(color: Color("timergrad3"), location: 0.85),
                           .init(color:
                            Color("timergrad4"), location: 0.98)
                        ],
                                       startPoint: .trailing,
                                       endPoint:
                                .bottomLeading
                    )
                        )
                    .cornerRadius(100)
                   
                    .frame(width: geometry.size.width)
                    .offset(x:  -geometry.size.width * (1 - CGFloat(remainingTime)/90))
                    .animation(.linear(duration: 1), value: remainingTime)
                    .drawingGroup()
            }
        }
    }
    
    private var PercentView: some View {
        Text("\(remainingTime)")
            .font(.system(size: 16))
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(remainingTime: .constant(0))
    }
}

