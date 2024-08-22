//
//  ConversationView.swift
//  HXD
//
//  Created by Ferdinand Jacques on 21/08/24.
//

import SwiftUI

struct ConversationView: View {
    @ObservedObject var viewModel: StoryViewModel
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            if viewModel.toneView == "Quiz" {
                ToneTop(viewModel: viewModel, homeViewModel: homeViewModel, hanzi: viewModel.currentStory.conversation[viewModel.currentConversationIndex].hanzi, pinyin: viewModel.currentStory.conversation[viewModel.currentConversationIndex].pinyin, meaning: viewModel.currentStory.conversation[viewModel.currentConversationIndex].meaning, speak: viewModel.currentStory.conversation[viewModel.currentConversationIndex].hanzi)
                RecordingView(mode: .conversation, viewModel: viewModel, homeVM: homeViewModel)
                    .padding(.top, 625)
                    .padding([.leading, .trailing])
            } else if viewModel.toneView == "Correct" {
                ToneTop(viewModel: viewModel, homeViewModel: homeViewModel, hanzi: viewModel.currentStory.conversationValidate)
                ToneCorrect(text: viewModel.currentStory.toneTest.happyDown, pad: 165, viewModel: viewModel)
            } else if viewModel.toneView == "Wrong" {
                ToneTop(viewModel: viewModel, homeViewModel: homeViewModel, hanzi: "Correct Answer is", pinyin: viewModel.currentStory.conversation[viewModel.currentConversationIndex].hanzi, meaning: viewModel.currentStory.conversation[viewModel.currentConversationIndex].pinyin)
                ToneWrong(text: viewModel.currentStory.toneTest.negativeDown, pad: 165, viewModel: viewModel)
            }
        }
    }
}

#Preview {
    ConversationView(viewModel: StoryViewModel(), homeViewModel: HomeViewModel())
}
