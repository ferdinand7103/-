//
//  OnboardingPage.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 14/08/24.
//

import SwiftUI

struct OnboardingPage: View {
    @State private var isShowingConfirmation: Bool = false
    @State private var isShowingDict: Bool = false
    @StateObject private var talkingAnimation = TalkingAnimation()
    @ObservedObject var viewModel: StoryViewModel
    @ObservedObject var homeViewModel: HomeViewModel


    var body: some View {
        ZStack {
            Image(viewModel.currentStory.background).resizable().modifier(BackgroundImageModifier())
            UpperButtons(isShowingConfirmation: $isShowingConfirmation, isShowingDict: $isShowingDict)
                .padding(.bottom, 680)
            TalkingView(images: ["Orange1","Orange2"],talkingAnimation: talkingAnimation)
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

            
            BubbleChatNext(text: viewModel.currentStory.onboarding[viewModel.currentOnboardingIndex].text, pos: viewModel.currentStory.onboarding[viewModel.currentOnboardingIndex].text, viewModel: viewModel)
                .padding(.bottom, 100)
                .zIndex(0)
            
            if isShowingConfirmation {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)

                ConfirmationView(isShowingConfirmation: $isShowingConfirmation, homeVM: homeViewModel)
                    .frame(width: 313, height: 282)
                    .transition(.scale)
                    .zIndex(100)
                    .padding(.bottom, 85)
            }
            if isShowingDict {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)

                DictionaryView(isShowingDict: $isShowingDict, viewModel:viewModel)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.scale)
                    .zIndex(100)
                    .padding(.bottom, 85)
            }
        }
    }
}

#Preview {
    OnboardingPage(viewModel: StoryViewModel(), homeViewModel: HomeViewModel())
}

struct BackgroundImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFill()
            .ignoresSafeArea()
    }
}
