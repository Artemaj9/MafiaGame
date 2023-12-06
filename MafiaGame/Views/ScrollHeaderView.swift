//
//  ScrollHeaderView.swift
//

import SwiftUI

struct ScrollHeaderView: View {
    @State private var offsetXFirst = -192.0;
    @State private var opacityFirst = 0.0;
    @State private var offsetXSecond = -192.0;
    @State private var opacitySecond = 0.0;
    @State private var offsetXThird = -192.0;
    @State private var opacityThird = 0.0;
    @State private var offsetXFourth = -192.0;
    @State private var opacityFourtht = 0.0;
    @Binding var searchText: String
    //@Binding var showHelpQuestions = true
    let defaultQuestions = [
        "What should I do as a Doctor in Mafia?",
        "As a Sheriff, who should I investigate first?",
        "I'm a Vigilante. Who should I target and why?",
        "How should I utilize my ability as a Godfather?",
        "I'm the Mafioso. Who should I kill first?",
        "How can I protect others as the Bodyguard?",
        "What should be my strategy as a Sheriff?"
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            firstHeaderBubble
            
//            ForEach(defaultQuestions, id: \.self) { question in
//                Button {
//                    searchText = question
//                } label: {
//                    Text(question)
//                        .font(Font.custom("Roboto-Medium", size: 16))
//                        .foregroundColor(.black)
//                        .padding(4)
//                        .background {
//                            Rectangle()
//                                .fill(.white)
//                                .cornerRadius(100)
//                        }
//                }
//                    }
//            .opacity(searchText.count > 5 ? 0 : 1)
//            .animation(.easeOut, value: searchText.count)
                }
       // .offset(y: 200)
      //  .padding(.leading, -12)
          //  }
      //  }
        .onAppear{
            withAnimation(.spring().delay(0.29)){
                opacityFirst = 1
                offsetXFirst = 0
            }
            withAnimation(.spring().delay(0.58)){
                opacitySecond = 1
                offsetXSecond = 0
            }
            withAnimation(.spring().delay(0.92)){
                opacityThird = 1
                offsetXThird = 0
            }
            withAnimation(.spring().delay(1.29)){
                opacityFourtht = 1
                offsetXFourth = 0
            }
        }
    }
}

extension ScrollHeaderView {
    
    var firstHeaderBubble: some View{
        HStack(alignment: .bottom) {
            ZStack {
                Rectangle()
                    .fill(.black)
                
                Rectangle()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [
                            Color("tbBlue"),
                            Color("tbBurgundy")]),
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                        
                    )
                    .saturation(1.4)
                    .mask({
                        Image("brain")
                            .scaleEffect(1.4)
                    })
            }
                .frame(width: 36, height: 36)
            MessageBubble(direction: .left) {
                VStack(alignment: .leading) {
                    Text("Whether you're a Mafia member trying to outwit the citizens, a Doctor looking for the best protection strategy, or an Executioner trying to manipulate the crowd, MafAdvisor is here to guide you. With an intuitive understanding of the game rules and a wealth of strategic knowledge, MafAdvisor will help you excel, no matter what role you play.")
                        .font(Font.custom("Roboto-Medium", size: 16))
                        .padding()
                }
                
                //.padding(.all, 20)
               // .padding(.horizontal)
                .foregroundColor(Color.white)
                .background(Color(.black))
            }
           
            .shadow(color: .black.opacity(0.24), radius: 2)
            
        }
        .opacity(opacityFirst)
        .offset(x: offsetXFirst)
    }
    var secondHeaderBubble: some View{
        MessageBubble(direction: .left) {
            VStack(alignment: .leading, spacing: 7){
                Text("ChatGPT Text")
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text("Unlock your potential with ChatGPT: The smarter way to stay organized and informed.")
                    .font(.caption2)
            }
                          
                                .padding(.all, 20)
                                .padding(.horizontal)
                                .foregroundColor(Color.black)
                                .background(Color.theme.firstListItemColor)
                                
        }.frame(width: 330)
            .opacity(opacityThird)
            .offset(x: offsetXThird)
    }
    var thirdHeaderBubble: some View{
        MessageBubble(direction: .left) {
            VStack(alignment: .leading, spacing: 7){
                Text("Dall-E Image")
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text("Unleash your creavity with Dall-E's personal assistant: Inspire and create effortlessly.")
                    .font(.caption2)
            }
                          
                                .padding(.all, 20)
                                .padding(.horizontal)
                                .foregroundColor(Color.black)
                                .background(Color.theme.secondListItemColor)
                                
        }.frame(width: 330)
            .opacity(opacityFourtht)
            .offset(x: offsetXFourth)
    }
    var sloganTextView: some View{
        Text("Discover your possibilities with my features!")
            .font(.subheadline)
            .padding(.vertical)
           // .fontWeight(.semibold)
            .padding(.leading, 7)
            .opacity(opacitySecond)
            .offset(x: offsetXSecond)
    }
}
struct ScrollHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollHeaderView(searchText: .constant(""))
    }
}
