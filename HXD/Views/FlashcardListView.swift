//
//  FlashcardListView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 12/08/24.
//

import SwiftUI

struct FlashcardListView: View {
    let TTS = TextToSpeechServices()
    @ObservedObject var flashcardVM = FlashcardViewModel()
   
    var body: some View {
        VStack {
            ForEach(flashcardVM.flashcards, id: \.self) { card in
                ZStack {
                    Image(card)
                        .resizable()
                        .scaledToFit()
                        .frame(width:300, height: 200)
                        .overlay(
                            Button(action: {
                                TTS.speak(text: card)
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
                                .padding(.top, 150)
                                .padding(.leading, 45)
                        )
                }
                
            }
        }
    }
}

#Preview {
    FlashcardListView()
}
