//
//  FlashcardSwipeView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 12/08/24.
//

import SwiftUI

struct FlashcardSwipeView: View {
    @ObservedObject var flashcardVM = FlashcardViewModel()
    @State private var currentIndex: Int = 0 // Ensure this is a plain Int
    @State private var offset: CGSize = .zero
    @State private var opacity: Double = 1.0

    var body: some View {
        ZStack {
            ForEach(0 ..< flashcardVM.flashcards.count, id: \.self) { index in
                if index >= currentIndex { // Safe comparison since currentIndex is an Int
                    FlashcardView(vocab: flashcardVM.flashcards[index], width: 300, height: 400)
                        .if(index == currentIndex) { view in
                            view
                                .opacity(opacity)
                                .offset(x: offset.width)
                                .offset(y: offset.height * 0.4)
                                .rotationEffect(.degrees(offset.width / 40.0))
                                .animation(.spring(), value: offset)
                        }
                        .if(index == currentIndex - 1) { view in
                            view
                                .opacity(1.0)
                                .offset(x: -300 + offset.width)
                                .zIndex(Double(flashcardVM.flashcards.count - index))
                                .animation(.spring(), value: offset)
                        }
                        .zIndex(Double(flashcardVM.flashcards.count - index))
                }
            }
        }
        .contentShape(Rectangle()) // Makes the entire ZStack draggable
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    offset = gesture.translation
                    if gesture.translation.width < -100 || gesture.translation.width > 100 {
                        opacity = 0.8
                    } else {
                        opacity = 1.0
                    }
                }
                .onEnded { gesture in
                    if gesture.translation.width < -100 {
                        // swipe left
                        withAnimation {
                            offset = CGSize(width: -500, height: 0)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                offset = .zero
                                opacity = 1.0
                                currentIndex = min(currentIndex + 1, flashcardVM.flashcards.count - 1)
                            }
                        }
                    } else if gesture.translation.width >= 100 && gesture.translation.width < 200, currentIndex > 0 {
                        // swipe right to bring back the previous card
                        withAnimation {
                            offset = CGSize(width: 200, height: 0)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                offset = .zero
                                opacity = 1.0
                                currentIndex = max(currentIndex - 1, 0)
                            }
                        }
                    } else {
                        // reset to center if not swiped far enough
                        withAnimation {
                            offset = .zero
                            opacity = 1.0
                        }
                    }
                }
        )
    }
}

#Preview {
    FlashcardSwipeView()
}


extension View {
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        condition ? AnyView(transform(self)) : AnyView(self)
    }
}
