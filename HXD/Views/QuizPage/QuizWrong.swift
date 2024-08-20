//
//  QuizWrong.swift
//  HXD
//
//  Created by Ferdinand Jacques on 20/08/24.
//

import SwiftUI

struct QuizWrong: View {
    @ObservedObject var viewModel: StoryViewModel
    
    var body: some View {
        ZStack {
            QuizTop(viewModel: viewModel, text: viewModel.currentStory.quiz1.negativeFlow)
            Wrong(hanzi: viewModel.currentStory.quiz1.choice[viewModel.currentStory.quiz1.correctAnswer].text, pinyin: viewModel.currentStory.quiz1.choice[viewModel.currentStory.quiz1.correctAnswer].pinyin, meaning: viewModel.currentStory.quiz1.meaning, pad: 165, viewModel: viewModel)
                .padding(.top, 550)
                .padding([.leading, .trailing])
        }
    }
}

#Preview {
    QuizWrong(viewModel: StoryViewModel())
}
