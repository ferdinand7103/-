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
            "你好",
            "我们",
            "人",
            "点菜",
            "公主",
            "谢谢",
            "开心",
            "礼物",
            "羊肉",
            "汤",
            "什么"
        ]
    }
}
