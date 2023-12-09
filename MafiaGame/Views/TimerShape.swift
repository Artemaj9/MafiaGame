//
//  TimerShape.swift
//  MafiaGame
//
//  Created by Artem on 09.12.2023.
//

import SwiftUI

import SwiftUI

struct TimerShape: View {
    
    //let radius, height: CGFloat
    var width = UIScreen.main.bounds.width
    
   // let magicRatio = 0.07826
    
    var body: some View {
        ZStack {
            Path { path in
                path.addArc(
                    center: CGPoint(x: 120, y: 100),
                    radius: 100,
                    startAngle: .degrees(180),
                    endAngle: .degrees(270),
                    clockwise: false
                )
                
                // Top right circular arc
                path.addArc(
                    center: CGPoint(x: width - 120, y: 100),
                    radius: 100,
                    startAngle: .degrees(-90),
                    endAngle: .degrees(0),
                    clockwise: false
                )
                
                path.closeSubpath()
            }
            .fill(
                LinearGradient(gradient: Gradient(colors: [
                    Color("tbBlue"),
                    Color("tbBurgundy")]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
            )
        }
       // .padding()
        //.stroke(Color.black, lineWidth: 2)
                
        }
    
        }
struct TabbarCurvedShape_Previews: PreviewProvider {
    static var previews: some View {
        TimerShape()
    }
}


