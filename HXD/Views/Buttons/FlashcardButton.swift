//
//  FlashcardButton.swift
//  HXD
//
//  Created by Ferdinand Jacques on 14/08/24.
//

import SwiftUI

struct FlashcardButton: View {
    @Binding var isShowingFlashcard: Bool

    var body: some View {
        ZStack {
            Button(action: {
                isShowingFlashcard = true
            }) {
                Rectangle()
                    .fill(Color.orange3)
                    .frame(width: 50, height: 50)
                    .overlay(
                        Image("bookOpen")
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .bold))
                    )
                    .cornerRadius(10)
            }

//            if isShowingFlashcard {
//                // Background overlay
//                Color.black.opacity(0.4)
//                    .ignoresSafeArea()
//                    .onTapGesture {
//                        isShowingFlashcard = false
//                    }
//
//                VStack {
//                    FlashcardSwipeView(isShowingFlashcard: $isShowingFlashcard)
//
//                    Button(action: {
//                        isShowingFlashcard = false
//                    }) {
//                        Text("Close")
//                            .foregroundColor(.white)
//                            .padding()
//                            .background(Color.red)
//                            .cornerRadius(10)
//                    }
//                    .padding(.top, 20)
//                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//            }
        }
    }
}

#Preview {
    FlashcardButton(isShowingFlashcard: .constant(false))
}
