//
//  CharacterGameCell.swift
//  MafiaGame
//
//  Created by Artem on 11.12.2023.
//

//
//  CharacterCell2.swift
//

import SwiftUI

struct CharacterGameCell: View {
    
  //  let character: CharacterModel
    let id: UUID
    let image: String
    var myGradient = Gradient(
        colors: [
            Color("strokeGrad4"),
            Color("strokeGrad3"),
            Color("strokeGrad2")
        ]
    )
    //var isDescription = true
   
    var name = ""
    @State var isBusted = false
    @State var isLeft = false
    let type: String
    init(id: UUID, image: String, myGradient: Gradient = Gradient(
        colors: [
            Color("strokeGrad4"),
            Color("strokeGrad3"),
            Color("strokeGrad2")
        ]
    ), name: String = "", isBusted: Bool = false, isLeft: Bool = false) {
        self.id = id
        self.image = image
        self.myGradient = myGradient
        self.name = name
        
        switch image {
        case "citizen","doctor", "sherif", "cop":
            self.type = "citizen"
            
        case "mafia","godfather", "mafioso","framer":
            self.type = "mafia"
        case "bodyuard","executioner","mistress","jester","vigilante":
            self.type = "neutral"
        default:
            self.type = "neutral"
        }
}
  
   // var type: Team = .mafia
    
    var body: some View {
        ZStack {
            
            GeometryReader { geo in
                VStack() {
                    ZStack(alignment: .top) {
                        
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .saturation(isBusted ? 0 : 1)
                            .overlay {
                                ZStack(alignment: .top) {
                                    Rectangle()
                                        .stroke(
                                            LinearGradient(
                                                gradient: myGradient,
                                                startPoint: .bottom,
                                                endPoint: .top
                                            ),
                                            lineWidth: 3
                                        )
                                        .cornerRadius(1)
                                }
                            }
                            .padding()
                            .background {
                                
                                ZStack {
                                    Color.black
                                    RadialGradient(colors: [Color(type + "Bg"),.black], center: .center, startRadius: 80, endRadius: 190)
                                    Color(type + "Bg").opacity(0.4)
                                    
                                    RadialGradient(colors: [.black.opacity(0),.black.opacity(0.3) ], center: .center, startRadius: 10, endRadius: 90)
                                        .mask {
                                            Image(image + "Rays")
                                                .resizable()
                                                .scaledToFit()
                                        }
                                    
                                    RadialGradient(colors: [Color("cubeGrad"),Color("cubeGrad").opacity(0.32),Color("cubeGrad").opacity(0) ], center: .center, startRadius: 1, endRadius: 190)
                                        .blur(radius: 10)
                                        .offset(y: -24)
                                        .mask {
                                            Image(image + "Figure")
                                                .resizable()
                                                .blur(radius: 2)
                                                .scaledToFit()
                                        }
                                }
                                .padding()
                            }
                        
                        Rectangle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [
                                    Color(type + "Color2").opacity(0),
                                    Color(type + "Color2"),
                                    Color(type + "Color2"),
                                    Color(type + "Color2").opacity(0)]),
                                               startPoint: .leading,
                                               endPoint: .trailing)
                            )
                            .frame(width: geo.size.width*0.7, height: geo.size.height/5)
                           
                            .overlay(
                                VStack {
                                    Text(name)
                                        .font(Font.custom("Roboto-Black", size: 15))
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 4)
                                    Text(image.uppercased())
                                        .font(Font.custom("Roboto-Bold", size: 12))
                                        .foregroundColor(.white)
                                        .shadow(color: .black, radius: 4)
                                
                                }
                            )
                            .offset(y: 0.65 * geo.size.width)
        
                        Text(isBusted ? "BUSTED" : "LEFT")
                            .font(Font.custom("Roboto-Black", size: 22))
                            .foregroundColor(isBusted ? Color("busted") : .white.opacity(0.85))
                            .shadow(color: .black, radius: 6)
                            .offset(y: 0.4 * geo.size.height)
                            .opacity(isBusted || isLeft ? 1 : 0)
                        
                        HStack(alignment: .top) {
                            Button {
                                // add some functions
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .fill(.white)
                                        .frame(width: 30, height: 30/1.5)
                                    
                                    Image("x")
                                        .scaleEffect(y: 1/1.5)
                                }
                            }

                       
                               
                            Spacer()
                            VStack(spacing: 0) {
                                ZStack {
                                    Rectangle()
                                        .fill(isBusted ? Color("mainSkull") : .white)
                                        .frame(width: 30, height: 30/1.5)
                                    Image("skull")
                                        .scaleEffect(y: 1/1.5)
                                }
                                .shadow(color: isBusted ? Color("mainSkull").opacity(0.64) : .white.opacity(0.64), radius: 4)
                                    .onTapGesture {
                                        isBusted.toggle()
                                    }
                                ZStack {
                                    Rectangle()
                                        .fill(isLeft ? .black : .white)
                                        .frame(width: 30, height: 30/1.5)
                                    
                                    if isLeft {
                                        Image("door")
                                            .colorInvert()
                                    } else {
                                        Image("door")
                                    }
                                     
                                }
                                    .onTapGesture {
                                        isLeft.toggle()
                                        
                                    }
                                    
                            }
                        }
                        .padding(18)
                        .offset(y: -geo.size.height/22)
                    }
                    .animation(.easeIn, value: isBusted)
                    .animation(.easeIn, value: isLeft)
                }
            }
        }
        
    }
}

