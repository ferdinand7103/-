//
//  FlashcardView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 12/08/24.
//

import SwiftUI

struct FlashcardView: View {
    let vocab: String
    var body: some View {
        Image(vocab)
            .resizable()
            .scaledToFit()
            .frame(width: 300, height: 200)
            .overlay(
                SoundButton(vocab: vocab)
                .padding(.top, 150)
                .padding(.leading, 50)
            )
    }
}

#Preview {
    FlashcardView(vocab: "狗")
}
