//
//  ConversationView.swift
//  HXD
//
//  Created by Ferdinand Jacques on 21/08/24.
//

import SwiftUI

struct ConversationView: View {
    @ObservedObject var viewModel: StoryViewModel
    
    var body: some View {
        ZStack {
            if viewModel.toneView == "Quiz" {
                ToneTop(viewModel: viewModel, hanzi: viewModel.currentStory.conversation[viewModel.currentConversationIndex].hanzi, pinyin: viewModel.currentStory.conversation[viewModel.currentConversationIndex].pinyin, meaning: viewModel.currentStory.conversation[viewModel.currentConversationIndex].meaning, speak: viewModel.currentStory.conversation[viewModel.currentConversationIndex].hanzi)
                RecordingView(mode: .conversation)
                    .padding(.top, 550)
                    .padding([.leading, .trailing])
            } else if viewModel.toneView == "Correct" {
                ToneTop(viewModel: viewModel, hanzi: viewModel.currentStory.toneTest.happyFlow)
                ToneCorrect(text: viewModel.currentStory.toneTest.happyDown, pad: 165, viewModel: viewModel)
            } else if viewModel.toneView == "Wrong" {
                ToneTop(viewModel: viewModel, hanzi: viewModel.currentStory.toneTest.negativeFlow)
                ToneWrong(text: viewModel.currentStory.toneTest.negativeDown, pad: 165, viewModel: viewModel)
                    .padding(.top, 550)
                    .padding([.leading, .trailing])
            }
        }
    }
}

#Preview {
    ConversationView(viewModel: StoryViewModel())
}
