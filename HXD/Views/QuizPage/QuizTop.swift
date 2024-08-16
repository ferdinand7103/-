//
//  QuizTop.swift
//  HXD
//
//  Created by Ferdinand Jacques on 14/08/24.
//

import SwiftUI

struct QuizTop: View {
    @State private var isShowingConfirmation: Bool = false
    @State private var isShowingFlashcard: Bool = false
    @StateObject private var talkingAnimation = TalkingAnimation()
    
    var body: some View {
        ZStack{
            Image("QuizStart")
                .padding(.bottom, 195)
            if isShowingConfirmation {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                
                ConfirmationView(isShowingConfirmation: $isShowingConfirmation)
                    .frame(width: 313, height: 282)
                    .transition(.scale)
                    .zIndex(3)
                    .padding(.bottom, 85)
            }
            if isShowingFlashcard {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                
                FlashcardSwipeView(isShowingFlashcard: $isShowingFlashcard)
                    .frame(width: 313, height: 282)
                    .transition(.scale)
                    .zIndex(3)
                    .padding(.bottom, 85)
            }
            UpperButtons(isShowingConfirmation: $isShowingConfirmation, isShowingFlashcard: $isShowingFlashcard)
                .padding(.bottom, 680)
            TalkingView(images: ["Orange1","Orange2"],talkingAnimation: talkingAnimation)
                .onAppear {
                    talkingAnimation.startTalking(duration: 5)
                }
                .padding(.trailing, 190)
                .padding(.bottom, 100)
            Image("OrangeStay")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.leading, 190)
                .padding(.bottom, 100)
            BubbleChat(text: "Ok, you already know some words! Do you know how to say “Hello” in Mandarin?")
                .padding(.bottom, 380)
        }
        .animation(.easeInOut, value: isShowingConfirmation)
    }
}

#Preview {
    QuizTop()
}
