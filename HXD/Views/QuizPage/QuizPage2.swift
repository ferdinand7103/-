//
//  QuizPage2.swift
//  HXD
//
//  Created by Ferdinand Jacques on 20/08/24.
//

import SwiftUI

struct QuizPage2: View {
    @ObservedObject var viewModel: StoryViewModel
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            if viewModel.quizView2 == "Quiz" {
                ToneTop(viewModel: viewModel, homeViewModel: homeViewModel, hanzi: viewModel.currentStory.quiz2.text, speak: viewModel.currentStory.quiz2.speak)
                if viewModel.showChoice {
                    QuizHanzi(choice1: viewModel.currentStory.quiz2.choice[0], choice2: viewModel.currentStory.quiz2.choice[1], choice3: viewModel.currentStory.quiz2.choice[2], choice4: viewModel.currentStory.quiz2.choice[3], correctAnswerIndex: viewModel.currentStory.quiz2.correctAnswer, viewModel2: viewModel)
                        .padding(.top, 550)
                        .padding([.leading, .trailing])
                }
            } else if viewModel.quizView2 == "Correct" {
                ToneTop(viewModel: viewModel, homeViewModel: homeViewModel, hanzi: viewModel.currentStory.quiz2.happyFlow)
                Correct(hanzi: viewModel.currentStory.quiz2.speak, pinyin: viewModel.currentStory.quiz2.pinyin, meaning: viewModel.currentStory.quiz2.meaning, viewModel: viewModel)
                    .padding(.top, 550)
            } else if viewModel.quizView2 == "Wrong" {
                ToneTop(viewModel: viewModel, homeViewModel: homeViewModel, hanzi: viewModel.currentStory.quiz2.negativeFlow)
                Wrong(hanzi: viewModel.currentStory.quiz2.speak, pinyin: viewModel.currentStory.quiz2.pinyin, meaning: viewModel.currentStory.quiz2.meaning, viewModel: viewModel)
                    .padding(.top, 550)
                    .padding([.leading, .trailing])
            }
        }
    }
}

#Preview {
    QuizPage2(viewModel: StoryViewModel(), homeViewModel: HomeViewModel())
}
