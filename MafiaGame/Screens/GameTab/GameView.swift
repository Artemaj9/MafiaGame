//
//  GameView.swift
//

import SwiftUI

struct GameView: View {
    
    @State private var isDay = false
    @State private var isUnfold = false
    @State var percent = 30
    @StateObject var vm = GameViewModel()
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: -16, alignment: nil),
        GridItem(.flexible(), spacing: -16, alignment: nil),
        GridItem(.flexible(), spacing: -16, alignment: nil)
    ]
    
    let characters = [
        CharacterModel(image: "citizen", number: "1", role: "CITIZEN", type: "citizen", description:
    "Ordinary townspeople who don't have special abilities. Their main goal is to survive and help identify the Mafia for lynching during the day.", isDescription: false),
        
        CharacterModel(image: "doctor", number: "2", role: "DOCTOR", type: "citizen", description:
    "Can protect other players from being eliminated by the Mafia at night. Typically they cannot protect the same person two nights in a row.", isDescription: false),
        
        CharacterModel(image: "sheriff", number: "3", role: "SHERIFF", type: "citizen", description:
    "A variant of the Detective. They can investigate other players to find out if they are suspicious (Mafia or Serial Killer) or not.", isDescription: false),
        
        CharacterModel(image: "cop", number: "4", role: "COP", type: "citizen", description:
    "Can investigate other players to determine their roles. They play a crucial role in guiding the citizens to make the right decisions.", isDescription: false),
        
        CharacterModel(image: "mafia", number: "5", role: "MAFIA",  type: "mafia", description:
    "The main antagonists who secretly eliminate citizens at night. They know each other's identity and conspire to deceive the town during the day.", isDescription: false),
        CharacterModel(image: "godfather", number: "6", role: "GODFATHER", type: "mafia", description:
    "The leader of the Mafia. Appears as a Citizen when investigated by the Detective. Immune to the Vigilante's attack.", isDescription: false),
        CharacterModel(image: "mafioso", number: "7", role: "MAFIOSO", type: "mafia", description:
    "A member of the Mafia who carries out the killing. If no Mafioso is present, the Godfather will carry out the kill.", isDescription: false),
        CharacterModel(image: "framer", number: "8", role: "FRAMER", type: "mafia", description:
    "A Mafia role that can frame other players, causing them to appear as Mafia when investigated by the Detective.", isDescription: false),
        CharacterModel(image: "bodyguard", number: "9", role: "BODYGUARD", type: "neutral", description:
    "Can protect a player from attacks at night. If their protected player is attacked, the Bodyguard and the attacker die instead.", isDescription: false),
        CharacterModel(image: "executioner", number: "10", role: "EXECUTIONER", type: "neutral", description:
    "Their goal is to get a specific person lynched. If that person dies at night or survives the game, the Executioner becomes a Jester.", isDescription: false),
        CharacterModel(image: "mistress", number: "11", role: "MISTRESS", type: "neutral", description:
    "Can distract a player each night, blocking them from using their ability.", isDescription: false),
        CharacterModel(image: "jester", number: "12", role: "JESTER", type: "neutral", description:
    "Their goal is to trick the town into lynching them. If they are killed at night or survive the game, they lose.", isDescription: false),
        CharacterModel(image: "vigilante", number: "13", role: "VIGILANTE", type: "neutral", description:
    "A citizen who can choose to kill other players at night. Their ability is usually limited to a certain number of uses. They need to use this power wisely to not accidentally eliminate innocent citizens.", isDescription: false),
        CharacterModel(image: "skiller", number: "14", role: "SERIAL KILLER", type: "neutral", description:
    "An independent role that tries to be the last one standing by killing one player every night. Not aligned with either the Mafia or the Citizens.", isDescription: false)
    ]
    
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
                            .animation(.easeInOut(duration: 1)
                                       , value: isUnfold)
                        }
                    }
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
                            isDay.toggle()
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
                            isDay.toggle()
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
                    TimerView(remainingTime: $vm.remainingTime)
                        .shadow(color: .black.opacity(0.32), radius: 4, x: 4, y: 0)
                        .overlay{
                            HStack {
                                Text("\(vm.remainingTime/60):\(vm.remainingTime%60/10)\(vm.remainingTime%60%10)")
                                    .font(Font.custom("Roboto-Medium", size: 18))
                                    .foregroundColor(.white)
                                    .shadow(color: .black, radius: 4)
                            Spacer()
                                Button {
                                    if vm.timerIsOn {
                                        vm.isPaused.toggle()
                                    } else {
                                        vm.setUpTimer()
                                    }
                                } label: {
                                    Text(vm.isPaused ? "Press to start" : "Press to stop")
                                        .font(Font.custom("Roboto-Regular", size: 15))
                                        .foregroundColor(.black)
                                }
                            }
                            .padding(40)
                            .offset(y: -24)
                        }
                        .offset(y: -geo.size.height/8 + 50)
                        .opacity(isDay ? 1 : 0)
                        .animation(.easeInOut(duration: 1.5), value: isDay)
                }
                .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    ScrollView(showsIndicators: false) {
                        Color.clear
                            .frame(height: 12)
                        LazyVGrid(
                            columns: columns,
                            alignment: .center,
                            spacing: -30
                        ) {
                            
                            ForEach(characters, id: \.self) { character in
                                GeometryReader { geo2 in
                                    CharacterCell2(character: character)
                                        .scaledToFill()
                                        .scaleEffect(y: 1.5)
                                        .frame(width: geo.size.width/4, height: geo.size.height/6)
                                        .padding(4)
                                        .padding(.vertical, 4)
                                        .offset(x: 12)
                                      .opacity(getScrollOpacity(geometry: geo2))
                                      .blur(radius: (1 -
                                                     getScrollOpacity(geometry: geo2))*3)
                                      .saturation(getScrollOpacity(geometry: geo2)*1.2)
                                }
                                .frame(
                                    width: geo.size.width * 0.35,
                                    height: geo.size.width * 0.43,
                                    alignment: .center
                                )
                            }
                        }
                        Color.clear
                            .frame(height: 64)
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, geo.size.height/4)
                }
                .opacity((isUnfold ? 1 : 0))
                .animation(.easeIn(duration: isUnfold ? 2 : 0.5), value: isUnfold)
            }
            .preferredColorScheme(.light)
        }
        .onAppear {
            vm.remainingTime = 90
        }
    }
    
    // MARK: - Functions

    func getScrollOpacity(geometry: GeometryProxy) -> Double {
        let maxY = UIScreen.main.bounds.height
        let currentY = geometry.frame(in: .global).minY
        let opacity: Double
        
        let yInitial = 0.45 * maxY
        let yInitial2 = 0.01 * maxY
        let yFinal = 0.7 * maxY
        let yFinal2 = -0.2 * maxY
        
        let k = 1 / (yInitial - yFinal)
        let kTop = 1 / (yInitial2 - yFinal2)
        let b = -k * yFinal
        let bTop = -kTop * yFinal2
        
        if currentY < yInitial && currentY > yInitial2 {
            opacity = 1
        } else if currentY >= yInitial {
            opacity = k * currentY + b
        } else {
            opacity = kTop * currentY + bTop
        }
        return opacity
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
