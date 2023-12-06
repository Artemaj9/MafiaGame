//
//  SearchView.swift
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var vm : HomeViewModel
    @Binding var searchText: String //= ""
    @State private var isTyped = false
    @State private var sendButtomImage =  "mic.fill"
    private let sendButtonImage =  "send"
    @State private var isListening = false
    @State private var offsetX = 292.0;
    @State private var opacity = 0.0;
    @State private var opacityQuestions = 0.0
    @State private var blurQuestions = 10.0
    let defaultQuestions = [
        "What should I do as a Doctor in Mafia?",
        "As a Sheriff, who should I investigate first?",
        "I'm a Vigilante. Who should I target and why?",
        "How should I utilize my ability as a Godfather?",
        "I'm the Mafioso. Who should I kill first?",
        "How can I protect others as the Bodyguard?",
        "What should be my strategy as a Sheriff?"
    ]
    @State private var isShowHelp = true
    
    var body: some View {
        VStack(alignment: .leading) {
            if isShowHelp {
                ForEach(defaultQuestions, id: \.self) { question in
                    Button {
                        searchText = question
                    } label: {
                        Text(question)
                            .font(Font.custom("Roboto-Medium", size: 14))
                            .foregroundColor(.black)
                            .padding(4)
                            .background {
                                Rectangle()
                                    .fill(.white)
                                    .cornerRadius(100)
                            }
                    }
                }
                .padding(.bottom, 8)
                .opacity(opacityQuestions)
                .blur(radius: blurQuestions)
                .opacity(searchText.count > 5 || !isShowHelp ? 0 : 1)
                .animation(.easeOut, value: searchText.count)
                .animation(.easeOut, value: isShowHelp)
            }
            ZStack(alignment: .leading) {
                ZStack{}
                    .frame(maxWidth: .infinity, maxHeight: 55)
                 
                    .background(.white)

                    .cornerRadius(16, corners: [.topLeft,.topRight])
                    .shadow(color: .black.opacity(0.32), radius: 16)
                    .padding(.horizontal, -14)
                
                HStack {
                    TextField("", text: $searchText)
                        .font(Font.custom("Roboto-Medium", size: 15))
                        .onChange(of: searchText) { newValue in
                            withAnimation(.spring()){
                                isTyped = newValue.isEmpty ? false : true
                            }
                        }
                    ZStack {
                        Image(sendButtonImage)
                            .opacity(searchText.count == 0 ? 0.5 : 1)
                            .animation(.easeOut, value: searchText.count)
                            //.rotationEffect(Angle(degrees: isTyped ? 45 : 0))
                    }
                    .frame(width: 50,height: 50)
                    .foregroundColor(.black)
                    .padding(.trailing, -8)
                    .onTapGesture {
                     
                        if !isTyped {

                        } else {
                            vm.addMessage(isAI: false, message: searchText)
                            searchText = ""
                            isShowHelp = false
                        }
                    }
                }
                
                Text(isTyped ? "Chat with me..." : "Start typing a message...")
                    .frame(height: 20, alignment: .leading)
                    .padding(.horizontal, 7)
                    .background(Color.white.cornerRadius(isTyped ? 16 : 0))
                    .font(Font.custom("Roboto-Medium", size: isTyped ? 13 : 15))
                    .padding(.top, isTyped ? -36 : 0)
                    .padding(.leading, 1)
                    .opacity(searchText.count > 4 ? 0 : 1)
                    .animation(.easeInOut(duration: 0.4), value: isTyped)
                    .animation(.easeInOut(duration: 0.4), value: searchText.count)
            }
            .frame(height: 50, alignment: .leading)
            .foregroundColor(.black)
            .offset(x: offsetX)
            .opacity(opacity)
            .onAppear {
                withAnimation(.spring().delay(1.58)){
                    opacity = 1
                    offsetX = 0
                }
            }
        }
        .onAppear {
            withAnimation(.spring().delay(0.09)) {
                opacityQuestions = 1
                blurQuestions = 0
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(searchText: .constant(""))
            .environmentObject(HomeViewModel())
    }
}
