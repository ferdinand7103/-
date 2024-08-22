//
//  ToneView.swift
//  HXD
//
//  Created by Ferdinand Jacques on 21/08/24.
//

import SwiftUI

struct ToneView: View {
    @ObservedObject var viewModel: StoryViewModel
    
    var body: some View {
        ZStack {
            if viewModel.toneView == "Quiz" {
                ToneTop(viewModel: viewModel, hanzi: viewModel.currentStory.toneTest.text, speak: viewModel.currentStory.toneTest.speak)
                RecordingView(mode: .pinyin, viewModel: viewModel)
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
    ToneView(viewModel: StoryViewModel())
}
