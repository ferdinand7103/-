//
//  PinYinTonePage.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 22/08/24.
//

import SwiftUI

struct PinYinTonePage: View {
    var image: String
    var nada: String
    var desc: String
    var hanzi: String
    var pinyin: String
    var meaning: String
    
    let tts = TextToSpeechServices()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Pin Yin Tone")
                .font(.system(size: 28))
                .fontWeight(.bold)
            
            // Main Tone Card
            VStack(spacing: 30) {
                // Tone Symbol
                Image(image)
                
                // Tone Description
                VStack(alignment: .leading, spacing: 5){
                    Text(nada)
                        .font(.system(size: 28))
                        .padding(.top, 10)
                    
                    Text(desc)
                        .font(.system(size: 18))
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: 350, alignment: .leading)
            }
            
            // Example Section
            VStack(spacing: 10) {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Example")
                            .font(.headline)
                            .padding(.bottom, 1)
                        Text(hanzi)
                            .font(.largeTitle)
                        Text("\(pinyin) \(meaning)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    BubbleSoundButton(icon: "sound", buttonAction: { tts.speak(text: image)}, size: 45, soundSize: 20)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.5)))
            }
        }
        .padding()
    }
}

#Preview {
    PinYinTonePage(image: "tone1", nada: "First Tone", desc: "Say “Ahhh” like at the dentist", hanzi: "妈", pinyin: "mā", meaning: "Mom")
}

