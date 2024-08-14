//
//  OnboardingPage.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 14/08/24.
//

import SwiftUI

struct OnboardingPage: View {
    @State private var isShowingConfirmation: Bool = false
    @State private var isShowingFlashcard: Bool = false
    @StateObject private var talkingAnimation = TalkingAnimation()


    var body: some View {
        ZStack {
            Image("Scene1").resizable().modifier(BackgroundImageModifier())
            UpperButtons(isShowingConfirmation: $isShowingConfirmation, isShowingFlashcard: $isShowingFlashcard)
                .padding(.bottom, 680)
            TalkingView(talkingAnimation: talkingAnimation)
                .onAppear {
                    talkingAnimation.startTalking(duration: 5)
                }
                .padding(.trailing, 190)
                .padding(.leading, 20)
                .padding(.top, 250)
                .zIndex(0)
            Image("OrangeStay")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.leading, 190)
                .padding(.top, 250)
                .zIndex(0)

            
            BubbleChatNext(text: "Hey, wanna go to the new chinese hotpot resto? If you can speak Mandarin, you can get a discount!")
                .padding(.bottom, 100)
                .zIndex(0)
            
            if isShowingConfirmation {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)

                ConfirmationView(isShowingConfirmation: $isShowingConfirmation)
                    .frame(width: 313, height: 282)
                    .transition(.scale)
                    .zIndex(100)
                    .padding(.bottom, 85)
            }
            if isShowingFlashcard {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)

                FlashcardSwipeView(isShowingFlashcard: $isShowingFlashcard)
                    .frame(width: 313, height: 282)
                    .transition(.scale)
                    .zIndex(100)
                    .padding(.bottom, 85)
            }
        }
    }
}

#Preview {
    OnboardingPage()
}

struct BackgroundImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .ignoresSafeArea()
    }
}
