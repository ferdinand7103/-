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
    @State private var lastSwipedIndex: Int? = nil
    
    var body: some View {
        ZStack {
            ForEach((0..<flashcardVM.flashcards.count).reversed(), id: \.self) { index in
                if index >= currentIndex {
                    ZStack {
                        Image(flashcardVM.flashcards[index])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 600, height: 400)
                            .offset(x: index == currentIndex ? offset.width : 0) // Apply offset to current card
                            .animation(.spring(), value: offset) // Smooth out the animation
                            .gesture(
                                DragGesture()
                                    .onChanged { gesture in
                                        offset = gesture.translation
                                    }
                                    .onEnded { gesture in
                                        if gesture.translation.width < -100 {
                                            // Swipe left
                                            withAnimation {
                                                offset = CGSize(width: -500, height: 0)
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                    offset = .zero
                                                    currentIndex = min(currentIndex + 1, flashcardVM.flashcards.count - 1)
                                                }
                                            }
                                        } else if gesture.translation.width > 100 && currentIndex > 0 {
                                            // Swipe right
                                            withAnimation {
                                                offset = CGSize(width: 500, height: 0)
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                                    offset = .zero
                                                    currentIndex = max(currentIndex - 1, 0)
                                                }
                                            }
                                        } else {
                                            // Reset to center if not swiped far enough
                                            withAnimation {
                                                offset = .zero
                                            }
                                        }
                                    }
                            )
                            .zIndex(Double(flashcardVM.flashcards.count - index)) // Ensure the current card is on top
                        
                        VStack {
                            Spacer()
                            SoundButton(vocab: flashcardVM.flashcards[index])
                                .frame(width: 100, height: 100)
                                .padding(.bottom, 10)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    FlashcardSwipeView()
}
