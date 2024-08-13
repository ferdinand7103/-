//
//  FlashcardView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 12/08/24.
//

import SwiftUI

struct FlashcardView: View {
    let vocab: String
    var width: CGFloat = 300
    var height: CGFloat = 200
    
    var body: some View {
        let buttonSize = min(width, height) * 0.2
        Image(vocab)
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
            .overlay(
                SoundButton(vocab: vocab)
                    .frame(width: buttonSize, height: buttonSize)
                    .padding(.top, height * 0.75)
                    .padding(.leading, width * 0.17)
            )
    }
}

#Preview {
    FlashcardView(vocab: "狗", width: 300, height: 200)
}
