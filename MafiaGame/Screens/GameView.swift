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
    
                    ZStack {
                        RoundedRectangle(cornerRadius: 100)
                            .fill(.white)
                            .shadow(color: .black.opacity(0.4), radius: 8, x: 0, y: 0)
                            .frame(width: 70, height: 28)

                        Button {
                            // unfold
                        } label: {
                            Image(systemName: "chevron.down")
                            .foregroundColor(.black)
                            .scaleEffect(1.3)
                        }
                    }
                    .offset(y: -10)
                    
                    HStack {
                      StatsView()
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
