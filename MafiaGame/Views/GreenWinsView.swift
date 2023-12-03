//
//  GreenWinsView.swift
//  MafiaGame
//
//  Created by Artem on 03.12.2023.
//

import SwiftUI

struct GreenWinsView: View {
    var body: some View {
        ZStack {
            Image("bgday")
                .resizable()
                .ignoresSafeArea()
            Image("")
            
            Image("doctorWin")
                .resizable()
            Image("sherifWin")
                .resizable()
            
            VStack {
                Spacer()
                HStack {
                    Image("citizencar1")
                        .resizable()
                    
                        //.frame(height: 200, width: 100)
                    // Image("citizencar2")
                    //    .resizable()
                }
            }
        }
        }
        
    }


struct GreenWinsView_Previews: PreviewProvider {
    static var previews: some View {
        GreenWinsView()
    }
}
