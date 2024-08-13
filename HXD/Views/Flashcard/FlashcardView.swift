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
        let soundButtonSize = min(width, height) * 0.120
        Image(vocab)
            .resizable()
            .scaledToFit()
            .frame(width: width, height: height)
            .shadow(radius: 1.5)
            .overlay(
                SoundButton(vocab: vocab)
                    .frame(width: soundButtonSize, height: soundButtonSize)
                    .padding(.top, height * 0.65)
                    .padding(.leading, width * 0.24)
            )
    }
}

#Preview {
    FlashcardView(vocab: "谢谢", width: 300, height: 400)
}
