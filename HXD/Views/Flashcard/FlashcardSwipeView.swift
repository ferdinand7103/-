//
//  FlashcardSwipeView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 12/08/24.
//

import SwiftUI

struct FlashcardSwipeView: View {
    @ObservedObject var flashcardVM = FlashcardViewModel()
    @State private var currentIndex = 0
    @State private var offset: CGSize = .zero

    var body: some View {
        ZStack {
            ForEach(0 ..< flashcardVM.flashcards.count, id: \.self) { index in
                if index >= currentIndex {
                    FlashcardView(vocab: flashcardVM.flashcards[index], width: 300, height: 600)
                        .offset(x: index == currentIndex ? offset.width : 0)
                        .animation(.spring(), value: offset)
                        
                        .zIndex(Double(flashcardVM.flashcards.count - index))
                }
            }
            
        }
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                }
                .onEnded { gesture in
                    if gesture.translation.width < -100 {
                        // swipe left
                        withAnimation {
                            offset = CGSize(width: -500, height: 0)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                offset = .zero
                                currentIndex = min(currentIndex + 1, flashcardVM.flashcards.count - 1)
                            }
                        }
                    } else if gesture.translation.width > -100 && currentIndex > 0 {
                        // swipe right
                        withAnimation {
                            offset = CGSize(width: -100, height: 0)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                offset = .zero
                                currentIndex = max(currentIndex - 1, 0)
                            }
                        }
                    }
                    
                    else {
                        // reset to center if not swiped far enough
                        withAnimation {
                            offset = .zero
                        }
                    }
                }
        )
    }
}

#Preview {
    FlashcardSwipeView()
}
