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
    let tts = TextToSpeechServices()

    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                Text(text)
                    .padding()
                    .foregroundColor(textColor)
                    .font(.system(size: 20, weight: .semibold))

                HStack {
                    BubbleSoundButton(icon: "sound") {
                        tts.speak(text: text)
                    }
                        .padding(.trailing, 10)
                    BubbleSoundButton(icon: "soundSlow") {
                        tts.speakSlow(text: text)
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
            }
            .padding(8)
            .frame(minWidth: 350, maxWidth: 350, alignment: .leading)
            .background(bubbleColor)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(bubbleColor, lineWidth: 1)
            )
            BubbleChatTail(pos: "A")
                .fill(bubbleColor)
                .frame(width: 30, height: 15)
                .offset(x: -30, y: -5)
        }
    }
}

#Preview {
    BubbleChatSoundOption(
        text: """
        你好，请问，你们几位？
        Nǐ hǎo, qǐng wèn, nǐmen jǐ wèi?
        Hi, may I ask, how many people are you?
        """,
        bubbleColor: .redLight
    )
}
