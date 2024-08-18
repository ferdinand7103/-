//
//  BubbleChatNext.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 14/08/24.
//

import SwiftUI

struct BubbleChatNext: View {
    var text: String
    var bubbleColor: Color = .white
    var textColor: Color = .black

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack (spacing: 0){
                    Text(text)
                        .padding(12)
                        .foregroundColor(textColor)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    HStack {
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Text("Next").font(.title3).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundStyle(.orange3)
                               
                        }
                    }
                    .padding(.top, 2)
                    .padding(.bottom, 16)
                    .padding(.horizontal, 16)
                    
                }
               
                
            }
            
            .frame(minWidth: 300, alignment: .leading)
            .frame(maxWidth: 300, alignment: .leading)
            .background(bubbleColor)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(bubbleColor, lineWidth: 1)
            )
            BubbleChatTail()
                .fill(bubbleColor)
                .frame(width: 30, height: 15)
                .offset(y: -5)
            
            
        }
    }
}

#Preview {
    BubbleChatNext(text: "This isasdkjhflddddddddjhjhjfhkhdfkjashfjkashfjskhfkjahkjdhak", bubbleColor: .greenLight)
}

