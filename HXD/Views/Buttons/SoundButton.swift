//
//  FlashcardButton.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 12/08/24.
//

import SwiftUI

struct SoundButton: View {
    let vocab: String
    let TTS = TextToSpeechServices()

    var body: some View {
        Button(action: {
            TTS.speak(text: vocab)
        }) {
            Circle()
                .fill(Color.blue)
                .frame(width: 30, height: 30)
                .overlay(
                    Image(systemName: "speaker.wave.2.fill")
                        .foregroundStyle(.white)
                        .font(.caption)
                )
        }
    }
}

#Preview {
    SoundButton(vocab: "听")
}
