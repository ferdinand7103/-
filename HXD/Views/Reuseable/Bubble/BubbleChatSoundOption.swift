//
//  BubbleChatSoundOption.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 20/08/24.
//

import SwiftUI

struct BubbleChatSoundOption: View {
    @State var hanzi: String
    @State var pinyin: String? = nil
    @State var meaning: String? = nil
    var speak: String
    var bubbleColor: Color = .white
    var textColor: Color = .black
    let tts = TextToSpeechServices()

    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    if (pinyin != nil){
                        Text(hanzi)
                            .padding([.top, .leading], 15)
                            .foregroundColor(textColor)
                            .font(.system(size: 20, weight: .semibold))
                        Text(pinyin ?? "")
                            .padding(.leading, 15)
                            .foregroundColor(textColor)
                            .font(.system(size: 18, weight: .semibold))
                        Text(meaning ?? "")
                            .padding(.leading, 15)
                            .padding(.bottom, 10)
                            .foregroundColor(textColor)
                            .font(.system(size: 18, weight: .semibold))
                    } else {
                        Text(hanzi)
                            .padding()
                            .foregroundColor(textColor)
                            .font(.system(size: 20, weight: .semibold))
                    }
                }
                HStack {
                    BubbleSoundButton(icon: "sound") {
                        tts.speak(text: speak)
                    }
                        .padding(.trailing, 10)
                    BubbleSoundButton(icon: "soundSlow") {
                        tts.speakSlow(text: speak)
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
    BubbleChatSoundOption(hanzi: "你好，请问，你们几位？", pinyin: "Nǐ hǎo, qǐng wèn, nǐmen jǐ wèi?", meaning: "Hi, may I ask, how many people are you?", speak: "你好", bubbleColor: .redLight)
}
