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
                    FlashcardView(vocab: card)                
                }
            }
        }
    }
}

#Preview {
    FlashcardListView()
}
