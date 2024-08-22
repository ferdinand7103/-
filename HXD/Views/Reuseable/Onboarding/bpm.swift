//
//  bpm.swift
//  HXD
//
//  Created by Ferdinand Jacques on 22/08/24.
//

import SwiftUI

struct bpm: View {
    var text: String
    var speak: String
    let tts = TextToSpeechServices()
    
    var body: some View {
        VStack(spacing: 10) {
            Text(text)
                .font(.system(size: 18))
                .foregroundStyle(.black)
            BubbleSoundButton(
                icon: "sound",
                buttonAction: { AudioRecorder().playSound(soundName: speak) },
                size: 25,
                soundSize: 12
            )
        }
        .frame(width: 77, height: 77)
        .background(Color.white)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 2)
        )
    }
}

#Preview {
    bpm(text: "b", speak: "b")
}
