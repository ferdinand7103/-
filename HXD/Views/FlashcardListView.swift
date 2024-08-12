//
//  FlashcardListView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 12/08/24.
//

import SwiftUI

struct FlashcardListView: View {
    @ObservedObject var flashcardVM = FlashcardViewModel()

    var body: some View {
        VStack {
            ForEach(flashcardVM.flashcards, id: \.self) { card in
                ZStack {
                    Image(card)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 200)
                        .overlay(
                            FlashcardButton(vocab: card)
                            .padding(.top, 150)
                            .padding(.leading, 50)
                        )
                }
            }
        }
    }
}

#Preview {
    FlashcardListView()
}
