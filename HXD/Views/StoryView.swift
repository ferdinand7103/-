//
//  StoryView.swift
//  HXD
//
//  Created by Rama Eka Hartono on 19/08/24.
//

import SwiftUI

struct StoryView: View {
    @StateObject private var viewModel = StoryViewModel()
    @StateObject private var learnVM = LearnViewModel()
    @ObservedObject var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack {
            switch viewModel.currentStage {
            case .onboarding:
                OnboardingPage(viewModel: viewModel, homeViewModel: homeViewModel)
            case .flashcard:
                FlashcardSwipeView(isShowingFlashcard: .constant(false), viewModel: viewModel, homeViewModel: homeViewModel)
            case .quiz1:
                QuizPage(viewModel: viewModel, homeViewModel: homeViewModel)
            case .quiz2:
                QuizPage2(viewModel: viewModel, homeViewModel: homeViewModel)
            case .toneTest:
                ToneView(viewModel: viewModel, homeViewModel: homeViewModel)
            case .conversation:
                ConversationView(viewModel: viewModel, homeViewModel: homeViewModel)
            case .completed:
                HXDView(homeViewModel: homeViewModel, viewModel: viewModel)
            }
        }
    }
}


#Preview {
    StoryView(homeViewModel: HomeViewModel())
}
