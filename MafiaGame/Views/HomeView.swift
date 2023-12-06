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
//                                        .opacity((Double(10 - searchText.count))/10)
                                        .animation(.easeOut, value: searchText.count)
                                    
                                    ForEach($vm.messages, id: \.id) { message in
                                        
                                        ChatBubble(isAI: message.isAI, message:message.message)
                                            .id(message.id)
                                    }
                                }
                            }
                            //.padding(.top, 4)

                            .onChange(of: vm.messages.count) { _ in
                                withAnimation(.spring()){
                                    if vm.messages.count >= 2 {
                                        proxy.scrollTo(vm.messages[vm.messages.count - 2].id, anchor: .top)
                                    }
                                   // proxy.scrollTo(vm.messages.last?.id, anchor: .bottom)
                                }
                            }
                            Color.clear
                                .frame(height: vm.messages.count >= 2 ? geo.size.height : geo.size.height/10)
                        }
                    }
                    .offset(y: keyboardHeight > 0 ? keyboardHeight - geo.size.height/10 - 8: 0)
                    
                    
                    SearchView(searchText: $searchText, keyboardHeight: $keyboardHeight)
                        .environmentObject(vm)
                        .offset(y:-geo.size.height/10)
                       // .offset(y: -keyboardHeight)
                        //.padding(.bottom, -keyboardHeight)
                        // 3.
                        
                    //  .padding(.bottom,14)
                }
                .offset(y: keyboardHeight > 0 ? -keyboardHeight + geo.size.height/10 + 8: 0)

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
