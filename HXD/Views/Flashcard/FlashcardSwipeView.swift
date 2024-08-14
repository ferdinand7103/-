//
//  FlashcardSwipeView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 12/08/24.
//

import SwiftUI

struct FlashcardSwipeView: View {
    @Binding var isShowingFlashcard: Bool
    @ObservedObject var flashcardVM = FlashcardViewModel()
    @State private var currentIndex: Int = 0
    @State private var offset: CGSize = .zero
    @State private var opacity: Double = 1.0
//    @State private var readyBtn = PrimaryButton()

    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    VStack {
                        ZStack {
                            ForEach(0 ..< flashcardVM.flashcards.count, id: \.self) { index in
                                if index >= currentIndex {
                                    createFlashcardView(for: index)
                                        .zIndex(Double(flashcardVM.flashcards.count - index))
                                }
                            }
                        }
                        HStack {
                            if currentIndex > 0 {
                                PreviousButton(action: {
                                    performSwipeLeft()
                                })
                            }
                            Spacer()
                            NextButton(action: {
                                performSwipeRight()
                            })
                        }
                    }
                }
                .contentShape(Rectangle())
                .gesture(createDragGesture())
                
                if (currentIndex == flashcardVM.flashcards.count - 1) {
                    PrimaryButton()
                } 
               
            }
            .padding()
            .background(
                .opacity(0)
        )
        }
    }

    // MARK: - Helper Methods

    private func createFlashcardView(for index: Int) -> some View {
        ZStack {
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

            SoundButton(vocab: flashcardVM.flashcards[index])
                .frame(width: 30, height: 30)
                .offset(x: 36, y: 130)
        }
        .frame(width: 300, height: 400)
    }

    private func createDragGesture() -> some Gesture {
        DragGesture()
            .onChanged { gesture in
                handleDragChanged(gesture: gesture)
            }
            .onEnded { gesture in
                handleDragEnded(gesture: gesture)
            }
    }

    private func handleDragChanged(gesture: DragGesture.Value) {
        offset = gesture.translation
        opacity = (abs(gesture.translation.width) > 100) ? 0.8 : 1.0
    }

    private func handleDragEnded(gesture: DragGesture.Value) {
        if gesture.translation.width < -100, currentIndex > 0 {
            performSwipeLeft()
        } else if gesture.translation.width >= 100 {
            performSwipeRight()
        } else {
            resetCardPosition()
        }
    }

    private func performSwipeLeft() {
        guard currentIndex > 0 else { return }
        withAnimation(nil) {
            offset = CGSize(width: 500, height: 0)
            currentIndex = max(currentIndex - 1, 0)
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                withAnimation {
                    offset = .zero
                }
            }
        }
    }

    private func performSwipeRight() {
        withAnimation {
            offset = CGSize(width: 500, height: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                offset = .zero
                opacity = 1.0
                if currentIndex == flashcardVM.flashcards.count - 1 {
                    currentIndex = 0
                } else {
                    currentIndex = min(currentIndex + 1, flashcardVM.flashcards.count - 1)
                }
            }
        }
    }

    private func resetCardPosition() {
        withAnimation {
            offset = .zero
            opacity = 1.0
        }
    }
}

#Preview {
    FlashcardSwipeView(isShowingFlashcard: .constant(false))
}

extension View {
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        condition ? AnyView(transform(self)) : AnyView(self)
    }
}
