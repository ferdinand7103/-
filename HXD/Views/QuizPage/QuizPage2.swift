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
            QuizHanzi(choice1: viewModel.currentStory.quiz2.choice[0], choice2: viewModel.currentStory.quiz2.choice[1], choice3: viewModel.currentStory.quiz2.choice[2], choice4: viewModel.currentStory.quiz2.choice[3], correctAnswerIndex: viewModel.currentStory.quiz1.correctAnswer, viewModel2: viewModel)
                .padding(.top, 550)
                .padding([.leading, .trailing])
        }
    }
}

#Preview {
    QuizPage2(viewModel: StoryViewModel())
}
