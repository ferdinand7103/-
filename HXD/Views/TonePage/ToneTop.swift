//
//  ToneView.swift
//  HXD
//
//  Created by Ferdinand Jacques on 21/08/24.
//

import SwiftUI

struct ToneTop: View {
    @State private var isShowingConfirmation: Bool = false
    @State private var isShowingFlashcard: Bool = false
    @StateObject private var talkingAnimation = TalkingAnimation()
    @ObservedObject var viewModel: StoryViewModel
    @State var hanzi: String
    @State var pinyin: String? = nil
    @State var meaning: String? = nil
    @State var speak: String? = nil
    
    var body: some View {
        ZStack{
            Image(viewModel.currentStory.background)
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
                
                FlashcardSwipeView(isShowingFlashcard: $isShowingFlashcard, viewModel: StoryViewModel())
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
                .padding(.bottom, 50)
            Image("OrangeStay")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.leading, 190)
                .padding(.bottom, 50)
            BubbleChatSoundOption(hanzi: hanzi, pinyin: pinyin, meaning: meaning, speak: speak ?? "")
                .padding(.bottom, 380)
        }
        .animation(.easeInOut, value: isShowingConfirmation)
    }
}

#Preview {
    ToneTop(viewModel: StoryViewModel(), hanzi: "你好，请问，你们几位？", pinyin: "Nǐ hǎo, qǐng wèn, nǐmen jǐ wèi?", meaning: "Hi, may I ask, how many people are you?", speak: "")
}
