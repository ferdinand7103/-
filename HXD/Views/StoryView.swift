//
//  StoryView.swift
//  HXD
//
//  Created by Rama Eka Hartono on 19/08/24.
//

import SwiftUI

struct StoryView: View {
    @StateObject private var viewModel = StoryViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.currentStage {
            case .onboarding:
                OnboardingPage(viewModel: viewModel)
            case .flashcard:
                FlashcardSwipeView(isShowingFlashcard: .constant(false), viewModel: viewModel)
            case .quiz1:
                QuizPage(viewModel: viewModel)
            case .quiz2:
                QuizPage2(viewModel: viewModel)
            case .toneTest:
                ToneView(viewModel: viewModel)
            case .conversation:
                ConversationView(viewModel: viewModel)
            case .completed:
                Text("Story Completed")
            }
//            Button(action: {
//                viewModel.moveToNextStage()
//            }) {
//                Text("Next")
//            }
        }
    }
}

#Preview {
    StoryView()
}
