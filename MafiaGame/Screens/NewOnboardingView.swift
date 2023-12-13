//
//  NewOnboardingView.swift
//  MafiaGame
//
//  Created by Artem on 13.12.2023.
//

import SwiftUI

struct NewOnboardingView: View {
    
    @EnvironmentObject var vm: GameCharacterData
    
    var body: some View {
        ZStack {
            Image("bgnight")
                .resizable()
                .ignoresSafeArea()
            GeometryReader { geo in
                ZStack {
                    LogoView()
                        .offset(y: -geo.size.height/5)
                    StrokeText(text: "WELCOME!", width: 4, color: .black)
                        .foregroundColor(Color("whitecity"))
                        .font(Font.custom("pricedown", size: 65))
                       
                    Text("Mafia Game Mastery (MGM) is an innovative application designed to enhance your experience in the popular game of Mafia. Equipped to handle the complexities of the first 14 characters, MGM offers tailored advice and strategic recommendations to players of all skill levels. Whether you're a novice trying to understand your role or a seasoned player seeking advanced tactics, MGM is your go-to assistant.")
                        .padding()
                        .font(Font.custom("Roboto-Mediun", size: 18))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .background(Color("textbg").opacity(0.8))
                        .offset(y: geo.size.height*0.24)
                    Button {
                        vm.firstStart = false
                    } label: {
                        Text("PROCEED")
                            .padding(.vertical, 8)
                            .font(Font.custom("Roboto-Black", size: 24))
                            .foregroundColor(.black)
                            .frame(width: geo.size.width*0.7)
                            .background {
                                Rectangle()
                                    .fill(Color("whitecity"))
                                    .shadow(color: .black.opacity(0.64), radius: 4)
                            }
                          
                            .offset(y: geo.size.height*0.45)
                    }

                }
            }
        }
    }
}
struct NewOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        NewOnboardingView()
    }
}
