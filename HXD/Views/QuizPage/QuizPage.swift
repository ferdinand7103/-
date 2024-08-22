//
//  QuizPage.swift
//  HXD
//
//  Created by Ferdinand Jacques on 13/08/24.
//

import SwiftUI

struct QuizPage: View {
    @ObservedObject var viewModel: StoryViewModel
    
    var body: some View {
        ZStack {
            if viewModel.quizView == "Quiz" {
                QuizTop(viewModel: viewModel, text: viewModel.currentStory.quiz1.text)
                QuizHanzi(choice1: viewModel.currentStory.quiz1.choice[0].text, choice2: viewModel.currentStory.quiz1.choice[1].text, choice3: viewModel.currentStory.quiz1.choice[2].text, choice4: viewModel.currentStory.quiz1.choice[3].text, pinyin1: viewModel.currentStory.quiz1.choice[0].pinyin, pinyin2: viewModel.currentStory.quiz1.choice[1].pinyin, pinyin3: viewModel.currentStory.quiz1.choice[2].pinyin, pinyin4: viewModel.currentStory.quiz1.choice[3].pinyin, correctAnswerIndex: viewModel.currentStory.quiz1.correctAnswer, viewModel2: viewModel)
                    .padding(.top, 550)
                    .padding([.leading, .trailing])
            } else if viewModel.quizView == "Correct" {
                QuizTop(viewModel: viewModel, text: viewModel.currentStory.quiz1.happyFlow)
                Correct(hanzi: viewModel.currentStory.quiz1.choice[viewModel.currentStory.quiz1.correctAnswer].text, pinyin: viewModel.currentStory.quiz1.choice[viewModel.currentStory.quiz1.correctAnswer].pinyin, meaning: viewModel.currentStory.quiz1.meaning, viewModel: viewModel)
                    .padding(.top, 550)
            } else if viewModel.quizView == "Wrong" {
                QuizTop(viewModel: viewModel, text: viewModel.currentStory.quiz1.negativeFlow)
                Wrong(hanzi: viewModel.currentStory.quiz1.choice[viewModel.currentStory.quiz1.correctAnswer].text, pinyin: viewModel.currentStory.quiz1.choice[viewModel.currentStory.quiz1.correctAnswer].pinyin, meaning: viewModel.currentStory.quiz1.meaning, viewModel: viewModel)
                    .padding(.top, 550)
                    .padding([.leading, .trailing])
            }
        }
    }
}

#Preview {
    QuizPage(viewModel: StoryViewModel())
}
