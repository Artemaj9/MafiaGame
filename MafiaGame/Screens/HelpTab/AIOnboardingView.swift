//
//  AIOnboardingView.swift
//  MafiaGame
//
//  Created by Artem on 07.12.2023.
//

import SwiftUI

struct AIOnboardingView: View {
    
    @State var step = 0
    @ObservedObject var vm: GameViewModel

    var body: some View {
        ZStack {
                Image("bgnight")
                    .resizable()
                    .ignoresSafeArea()
            GeometryReader { geo in
                VStack(alignment: .center) {
                    Text("MeetMafAdvisor")
                        .font(Font.custom("Roboto-Bold", size: 32))
                        .shadow(color: .white, radius: 2)
                        .foregroundColor(.white)
                    HStack {
                        Spacer()
                        Image("onboardBubble")
                            .resizable()
                            .frame(width: geo.size.width * 0.67,height:  geo.size.height * 0.25)
                            .overlay {
                                Text(step == 0 ? OnboardingModel.Speech.first : OnboardingModel.Speech.second)
                                    .font(Font.custom("Roboto-Bold", size: 15))
                                    .foregroundColor(.white)
                                    .shadow(color: .black.opacity(0.8), radius: 2)
                                    .padding(.horizontal, geo.size.width/15)
                                    .offset(x: geo.size.width/50, y: -geo.size.height/35)
                            }
                    }
                    
                }
                
                Button {
                    if step == 0 {
                        step += 1
                    } else {
                        vm.onboardingHasShown = true
                    }
                } label: {
                    ZStack {
                        Rectangle()
                            .frame(width: geo.size.width * 0.4, height: geo.size.height * 0.045)
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.64), radius: 2)
                        
                        Text("NEXT")
                            .font(Font.custom("Roboto-Bold", size: 18 ))
                            .foregroundColor(.black)
                    }
                }
                .offset(x: geo.size.width * 0.55 ,y: geo.size.height/2)

                Image("aihelper")
                    .resizable()
                    .frame(width: 0.57 * geo.size.width, height: 0.8 * geo.size.height)
                    .offset(y: geo.size.height * 0.2)
            }
        }
    }
}

struct AIOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        AIOnboardingView(vm: GameViewModel())
    }
}
