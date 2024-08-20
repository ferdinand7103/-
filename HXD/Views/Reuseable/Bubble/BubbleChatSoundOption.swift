//
//  BubbleChatSoundOption.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 20/08/24.
//

import SwiftUI

struct BubbleChatSoundOption: View {
    var text: String
    var bubbleColor: Color = .white
    var textColor: Color = .black

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(text)
                    .padding(16)
                    .foregroundColor(textColor)
                    .font(.system(size: 20, weight: .bold))
                Spacer(minLength: 0)
            }
            .frame(minWidth: 300, maxWidth: 300, alignment: .leading)
            .background(bubbleColor)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(bubbleColor, lineWidth: 1)
            )
            BubbleChatTail(pos: "A")
                .fill(bubbleColor)
                .frame(width: 30, height: 15)
                .offset(y: -5)
        }
    }
}

#Preview {
    BubbleChatSoundOption(text: "Now, repeat after me: 你好 (Nǐ hǎo).", bubbleColor: .blue)
}
