//
//  GameView.swift
//

import SwiftUI

struct GameView: View {
    
    @State private var isDay = false
    @State private var isUnfold = false
    
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
                        .frame(height: isUnfold ? geo.size.height * 0.85 : geo.size.height/10)
                        .animation(.easeInOut(duration: 1), value: isUnfold)
    
                    ZStack {
                        RoundedRectangle(cornerRadius: 100)
                            .fill(.white)
                            .shadow(color: .black.opacity(0.4), radius: 8, x: 0, y: 0)
                            .frame(width: 70, height: 28)
                            .animation(.easeInOut(duration: 1), value: isUnfold)

                        Button {
                            isUnfold.toggle()
                        } label: {
                            Image(systemName: "chevron.down")
                            .rotationEffect(.degrees(isUnfold ? 180 : 0))
                            .foregroundColor(.black)
                            .scaleEffect(1.3)
                            .animation(.easeInOut(duration: 1), value: isUnfold)
                        }
                    }
                  //  .animation(.easeInOut(duration: 1), value: isUnfold)
                    .offset(y: -10)
                    
                    HStack {
                      StatsView()
                            .opacity(isUnfold ? 0 : 1)
                            .animation(.easeInOut(duration: 1), value: isUnfold)
                    }
                    .padding(.top, 8)
                    
                        
                    Spacer()
                    Spacer()
                    Spacer()
                    HStack(spacing: 24) {
                        Button {
                            
                        } label: {
                            Circle()
                                .fill(.white)
                                .frame(width: 48)
                                .shadow(color: isDay ? .black.opacity(0.64) : .white.opacity(0.64), radius: 4)
                                .overlay {
                                    Image("back")
                                }
                              
                        }
                        
                        Button {
                            isDay.toggle()
                        } label: {
                            Circle()
                                .fill(isDay ? .yellow : .blue)
                                .frame(width: 80)
                                .shadow(color: isDay ? .black.opacity(0.64) : .white.opacity(0.44), radius: 4)
                            
                                .overlay {
                                    Image(isDay ? "sunbtn" : "moonbtn")
                                }
                        }
                        
                        Button {
                            
                        } label: {
                            Circle()
                                .fill(.white)
                                .frame(width: 48)
                                .shadow(color: isDay ? .black.opacity(0.64) : .white.opacity(0.64), radius: 4)
                                .overlay {
                                    Image("forward")
                                }
                        }
                    }
                    .opacity(isUnfold ? 0 : 1)
                    .animation(.easeInOut(duration: 0.5), value: isUnfold)
                    Spacer()
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
