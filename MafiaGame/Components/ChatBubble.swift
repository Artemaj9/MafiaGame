//
//  ChatBubble.swift
//

import SwiftUI

struct ChatBubble: View {
    @StateObject private var imageViewModel = ImageViewModel()
    
    @Binding var isAI : Bool
    @Binding var message: String
    @State private var opacityAndScale = 0.0
    @State private var offsetX = 0.0
    var body: some View {
        HStack(alignment: .bottom, spacing: 0){
//            if(!isAI){
//                paddingBalloon
//            }
            if isAI {
                AvatarView(isAI: isAI)
                .frame(width: 36, height: 36)
            }
            
            MessageBubble(direction: isAI ? .left : .right) {
                VStack(alignment: .leading, spacing: 7){
                 //   Text(isAI ? "AI" : "You")
                   //     .font(.subheadline)
                     //   .fontWeight(.bold)
                    if message.contains("http") {
                        
                        if let image = imageViewModel.image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                        } else {
                            ProgressView()
                        }
                    } else {
                        Text(message)
                            .font(Font.custom("Roboto-Medium", size: 15))
                           // .font(.headline)
                            //.fontWeight(.regular)
                    }
                }
                .padding(.all, 20)
                .padding(.horizontal)
                .foregroundColor(isAI ? .white : .black)
                .background(isAI ? .black : .white)
            }
            .scaleEffect(opacityAndScale)
            .opacity(opacityAndScale)
            .offset(x: offsetX)
            
            if !isAI {
                AvatarView(isAI: isAI)
                    .frame(width: 36, height: 36)
            }
            if(isAI){
                paddingBalloon
            }
        }
        .onAppear {
            offsetX = isAI ? -229 : 229
            withAnimation(.spring()){
                opacityAndScale = 1
                offsetX = 0
            }
            
            if message.contains("https") {
                guard let url = URL(string: message) else { return }
                imageViewModel.downloadImage(from: url)
            }
        }
    }
}

extension ChatBubble {
    var paddingBalloon: some View {
        HStack{}
            .frame(width: 29, height: 14)
            .padding(0)
    }
}
struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        ChatBubble(isAI: .constant(true), message: .constant("Baris Message will be shown here"))
    }
}
