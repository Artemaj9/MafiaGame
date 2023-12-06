//
//  HomeView.swift
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewModel()
    @State var searchText = ""
    @State var showHeader = true
    
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

                            .onChange(of: vm.messages.count) { _ in
                                withAnimation(.spring()){
                                    proxy.scrollTo(vm.messages.last?.id, anchor: .bottom)
                                }
                            }
                        }
                    }
                    
                    SearchView(searchText: $searchText)
                        .environmentObject(vm)
                        .offset(y:-geo.size.height/10)
                    //  .padding(.bottom,14)
                }
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
