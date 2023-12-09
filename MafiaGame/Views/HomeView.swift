//
//  HomeView.swift
//

import SwiftUI
import Combine

struct HomeView: View {
    
    @StateObject var vm = HomeViewModel()
    
    @State private var showHeader = true
    @State private var keyboardHeight: CGFloat = 0
    @State var searchText = ""
    
    var body: some View {
        ZStack {
            backgroundView
                .ignoresSafeArea()
            GeometryReader { geo in
                VStack {
                    ScrollView(showsIndicators: false) {
                        ScrollViewReader { proxy in
                            VStack(alignment: .leading){
                                if showHeader {
                                    ScrollHeaderView(searchText: $searchText)
                                        .animation(.easeOut, value: searchText.count)
                                    
                                    ForEach($vm.messages, id: \.id) { message in
                                        
                                        ChatBubble(isAI: message.isAI, message:message.message)
                                            .id(message.id)
                                    }
                                }
                            }

                            .onChange(of: vm.messages.count) { _ in
                                withAnimation(.spring()){
                                    if vm.messages.count >= 3 {
                                        proxy.scrollTo(vm.messages[vm.messages.count - 3].id, anchor: .top)
                                    }
                                }
                            }
                            Color.clear
                                .frame(height: vm.messages.count >= 2 ? geo.size.height : geo.size.height/10)
                        }
                    }
                    .offset(y: keyboardHeight > 0 ? keyboardHeight - geo.size.height/10 - 8: 0)
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                    }
                    
                    
                    SearchView(searchText: $searchText, keyboardHeight: $keyboardHeight)
                        .environmentObject(vm)
                        .offset(y:-geo.size.height/10)
                }
                .offset(y: keyboardHeight > 1 ? -keyboardHeight + geo.size.height/10 + 8: 0)

                .onReceive(Publishers.keyboardHeight) { self.keyboardHeight = $0
                    print(self.keyboardHeight)
                }
                .animation(.spring(), value: keyboardHeight)
                .padding(8)
            }
        }
        .preferredColorScheme(.dark)
}
}

extension HomeView {
    var backgroundView: some View{
        ZStack {
            Image("bgday")
                .resizable()
                .hueRotation(Angle(degrees: 25))
                .contrast(1)
                .saturation(1.2)
                .colorMultiply(Color("bgMultiplyColor"))
        }
        .opacity(1)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
