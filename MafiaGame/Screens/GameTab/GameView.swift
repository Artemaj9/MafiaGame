//
//  GameView.swift
//

import SwiftUI
import MobileCoreServices
import UniformTypeIdentifiers

struct GameView: View {
    
    @State private var isDay = true
    @State private var isUnfold = false
    @State var percent = 30
    @StateObject var vm = GameViewModel()
    @EnvironmentObject var gameLoic: GameControlModel
    @State var characterName = ""
   // @State var busted = 0
    
    var body: some View {
        ZStack {
                
            GeometryReader { geo in
                Image(isDay ? "bgday" : "bgnight")
                    .resizable()
                    .ignoresSafeArea()
                    .animation(.easeInOut(duration: 1.5), value: isDay)
                
                // Horizontal bottom stack
                VStack {
                    ZStack {
                    if gameLoic.selectedCharacters.isEmpty {
                        Text("Add characters here")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .shadow(color: .black.opacity(0.64), radius: 2)
                            .offset(y: geo.size.height/10)
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        // Row with characters
                        HStack {
                            ForEach(gameLoic.selectedCharacters.reversed()) { character in
                                if character.image != "" {
                                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                                        
                                        ZStack(alignment: .bottom) {
                                            Image(character.image)
                                                .resizable()
                                                .frame(width: 100, height: 100)
                                                .cornerRadius(15)
                                            Text(character.name)
                                                .font(Font.custom("Roboto-Black", size: 24))
                                                .minimumScaleFactor(0.4)
                                                .foregroundColor(.white)
                                        }
                                        .frame(width: 100, height: 100)
                                        
                                        Button {
                                            withAnimation(.easeOut) {
                                                self.gameLoic.selectedCharacters.removeAll { (check) -> Bool in
                                                    if check.id == character.id { return true }
                                                    else { return false }
                                                }
                                            }
                                        } label: {
                                            Image(systemName: "xmark")
                                                .foregroundColor(.white)
                                                .padding(10)
                                                .background(.black)
                                                .clipShape(Circle())
                                        }
                                    }
                                }
                            }
                        }
                        .onDrop(of: [UTType.url], delegate: gameLoic)
                    }
                   // .padding(.horizontal)
                    .offset(y: geo.size.height/8)
                }
               }
                .frame(width: geo.size.width, height: geo.size.height, alignment: .bottom)
               .offset(y: -geo.size.height/4)
               .background(Color.black.opacity(0.15))
               .onDrop(of: [UTType.url], delegate: gameLoic)
               .opacity(isUnfold ? 1 : 0)
               .animation(.easeOut(duration: 2), value: isUnfold)
    
                // new stack 2
                
                VStack(spacing: 0) {
                
                        ScrollView(showsIndicators: false) {
                            Color.clear
                                .frame(height: 12)
                            LazyVGrid(
                                columns: columns,
                                alignment: .center,
                                spacing: 0
                            ) {
                                
                                ForEach(gameLoic.selectedCharacters) { character in
                                    GeometryReader { geo2 in
                                        CharacterGameCell(id: character.id, image: character.image, name: character.name, busted: $gameLoic.busted)
                                            .scaledToFill()
                                            .scaleEffect(y: 1.5)
                                            .frame(width: geo.size.width/4, height: geo.size.height/6)
                                            .padding(4)
                                            .padding(.vertical, 4)
                                            .offset(x: 12)
                                            .opacity(getScrollOpacityNew(geometry: geo2))
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
                                .frame(height: 224)
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, geo.size.height/3)
                }
                .opacity((isUnfold ? 0 : 1))
                .animation(.easeIn(duration: isUnfold ? 2 : 0.5), value: isUnfold)
                .offset(y: geo.size.height/6)
                
                VStack {
                    Rectangle()
                        .fill(.white)
                        .cornerRadius(12, corners: [.bottomLeft, .bottomRight])
                        .padding([.leading, .trailing], 12)
                        .frame(height: isUnfold ? geo.size.height * 0.75 : geo.size.height/10)
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
                        StatsView(vm: gameLoic, busted: $gameLoic.busted)
                            .opacity(isUnfold ? 0 : 1)
                            .animation(.easeInOut(duration: 1), value: isUnfold)
                    }
                    .padding(.top, 8)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    HStack(spacing: 24) {
                        Button {
                            phaseChange()
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
                            phaseChange()
                        } label: {
                            Circle()
                                .fill(isDay ? dayGradient : nightGradient)
                                .frame(width: 80)
                                .shadow(color: isDay ? .black.opacity(0.64) : .white.opacity(0.44), radius: 4)
                                .animation(.easeInOut(duration: 1), value: isDay)
                                .overlay {
                                    Image(isDay ? "sunbtn" : "moonbtn")
                                }
                        }
                        
                        Button {
                            phaseChange()
                            
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
                        .overlay {
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
                        .offset(y: isDay ? 0: 50)
                        .offset(y: isUnfold ? 50 : 0)
                        .animation(.easeInOut(duration: 1.5), value: isDay)
                        .animation(.easeInOut(duration: 1.5), value: isUnfold)
                }
                .ignoresSafeArea()
                
                //Stack on white sheet
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
                                            .onDrag {
                                                NSItemProvider(item: .some(URL(string: character.image)! as NSSecureCoding), typeIdentifier: UTType.url.identifier)
                                            }
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
                        .padding(.bottom, geo.size.height/3) // - влияет на сворачивание
                }
                .opacity((isUnfold ? 1 : 0))
                .animation(.easeIn(duration: isUnfold ? 2 : 0.5), value: isUnfold)
        
            .preferredColorScheme(.light)
            if gameLoic.showAlert {
                CustomAlertView(
                    title: "WRITE NAME",
                    material: .ultraThin,
                    primaryAction: {
                        gameLoic.selectedCharacters[gameLoic.elementToChange].name = characterName
                        
                        characterName = ""
                        withAnimation {
                            gameLoic.showAlert.toggle()
                        }
                    },
                    primaryActionTitle: "OK",
                    customContent:
                        VStack {
                            TextField("",text: $characterName)
                                .font(Font.custom("Roboto-Black", size: 36))
                                .foregroundColor(.white)
                                .background(
                                    Rectangle()
                                        .fill(.black)
                                )
                        }
                )
            }
        }
            Button {
                gameLoic.startGame()
                isDay = false
                playSound(key: "coolnight", player: &player)
                gameLoic.checkGame()
            } label: {
                Text("Start Game")
                    .font(Font.custom("Roboto-Black", size: 36))
                    .foregroundColor(.white)
                    .shadow(color: isDay ? .black.opacity(0.64) : .white.opacity(0.64), radius: 4)
            }
            .opacity(
                gameLoic.selectedCharacters.count >= 3 && !gameLoic.isGame ? 1 : 0)
            .offset(x: isUnfold ?  -400 : 0)
            .animation(.spring(),value: isUnfold)
            .animation(.easeInOut,value: gameLoic.isGame)
        }
        .onAppear {
            vm.remainingTime = 90
            playSound(key: "dayBack", player: &player)
        }
    }
    
    // MARK: - Functions
    
    func phaseChange() {
        isDay.toggle()
        vm.animationTransition()
        playSound(key: isDay ? "dayBack" : "coolnight", player: &player)
        if isDay {
            vm.resetTimer()
        }
    }

    func getScrollOpacity(geometry: GeometryProxy) -> Double {
        let maxY = UIScreen.main.bounds.height
        let currentY = geometry.frame(in: .global).minY
        let opacity: Double
        
        let yInitial = 0.35 * maxY
        let yInitial2 = 0.01 * maxY
        let yFinal = 0.60 * maxY
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
    
    func getScrollOpacityNew(geometry: GeometryProxy) -> Double {
        let maxY = UIScreen.main.bounds.height
        let currentY = geometry.frame(in: .global).minY
        let opacity: Double
        
        let yInitial = 0.4 * maxY
        let yInitial2 = 0.25 * maxY
        let yFinal = 0.60 * maxY
        let yFinal2 = 0.1 * maxY
        
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
