//
//  SearchView.swift
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var vm : HomeViewModel
    @Binding var searchText: String //= ""
    @State private var isTyped = false
    @State private var sendButtomImage =  "mic.fill"
    private let sendButtomImages = ["paperplane.fill","mic.fill","stop.circle.fill"]
    @State private var isListening = false
    @State private var offsetX = 292.0;
    @State private var opacity = 0.0;
    
    var body: some View {
        ZStack(alignment: .leading){
            ZStack{}
                .frame(maxWidth: .infinity, maxHeight: 55)
                .background(.white)
                .cornerRadius(16, corners: [.topLeft,.topRight])
//                .overlay(
//                    RoundedRectangle(cornerRadius: 14)
//                        .stroke(.blue, lineWidth: 1)
//                )
                .padding(.horizontal, -14)

            HStack{
                TextField("", text: $searchText)
                    .onChange(of: searchText) { newValue in
                        withAnimation(.spring()){
                            isTyped = newValue.isEmpty ? false : true
                            
                            sendButtomImage = isTyped ? sendButtomImages[0] :  sendButtomImages[1]
                        }
                    }
                ZStack{
                    Image(systemName: sendButtomImage)
                        .rotationEffect(Angle(degrees: isTyped ? 45 : 0))
                }
                .frame(width: 50,height: 50)
                //.background(.blue)
               // .cornerRadius(14)
                .foregroundColor(.black)
                .padding(.trailing, -14)
                .onTapGesture {
                    if !isTyped {
                        isListening.toggle()
                        withAnimation(.spring()) {
                            sendButtomImage = isListening ? sendButtomImages[2] : sendButtomImages[1]
                        }
                    } else {
                       
                        vm.addMessage(isAI: false, message: searchText)
                        searchText = ""
                    }
                }
            }
            
            Text(isTyped ? "Chat with me..." : "Start typing a message...")
                .frame(height: 20, alignment: .leading)
                .padding(.horizontal, 7)
                .background(.white)
                .font(Font.system(size: isTyped ? 13 : 16))
                .padding(.top, isTyped ? -36 : 0)
                .padding(.leading, 1)
                .opacity(searchText.count > 4 ? 0 : 1)
                .animation(.easeInOut(duration: 0.4), value: isTyped)
                .animation(.easeInOut(duration: 0.4), value: searchText.count)
        }
        .frame(height: 50, alignment: .leading)
        .foregroundColor(.black)
        //.padding(.horizontal, 14)
        //.padding(.horizontal, 14)
        .offset(x: offsetX)
        .opacity(opacity)
        .onAppear {
            withAnimation(.spring().delay(1.58)){
                opacity = 1
                offsetX = 0
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
