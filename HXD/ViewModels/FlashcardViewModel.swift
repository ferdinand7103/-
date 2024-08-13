//
//  FlashcardViewModel.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 12/08/24.
//

import Foundation

class FlashcardViewModel: ObservableObject {
    @Published var flashcards: [String] = []
    
    init() {
        loadFlashcards()
    }
    
    func loadFlashcards() {
        flashcards = [
            "狗",
            "猫",
            "兔子"
        ]
    }
}
