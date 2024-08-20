//
//  QuizPage2.swift
//  HXD
//
//  Created by Ferdinand Jacques on 20/08/24.
//

import SwiftUI

struct QuizPage2: View {
    @ObservedObject var viewModel: StoryViewModel
    
    var body: some View {
        ZStack {
            QuizTop(viewModel: viewModel, text: viewModel.currentStory.quiz2.text)
            ZStack {
                if viewModel.quizView2 == "Quiz" {
                    QuizHanzi(choice1: viewModel.currentStory.quiz2.choice[0], choice2: viewModel.currentStory.quiz2.choice[1], choice3: viewModel.currentStory.quiz2.choice[2], choice4: viewModel.currentStory.quiz2.choice[3], correctAnswerIndex: viewModel.currentStory.quiz2.correctAnswer, viewModel2: viewModel)
                        .padding(.top, 550)
                        .padding([.leading, .trailing])
                } else if viewModel.quizView2 == "Correct" {
                    Correct(hanzi: viewModel.currentStory.quiz2.speak, pinyin: viewModel.currentStory.quiz2.pinyin, meaning: viewModel.currentStory.quiz2.meaning, pad: 70, viewModel: viewModel)
                        .padding(.top, 550)
                } else if viewModel.quizView2 == "Wrong" {
                    Wrong(hanzi: viewModel.currentStory.quiz2.speak, pinyin: viewModel.currentStory.quiz2.pinyin, meaning: viewModel.currentStory.quiz2.meaning, pad: 165, viewModel: viewModel)
                        .padding(.top, 550)
                        .padding([.leading, .trailing])
                }
            }
        }
    }
}

#Preview {
    QuizPage2(viewModel: StoryViewModel())
}
