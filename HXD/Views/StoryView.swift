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
                FlashcardSwipeView(isShowingFlashcard: .constant(false), viewModel: StoryViewModel())
                Text("flash")
            case .quiz1:
//                Quiz1View(viewModel: viewModel)
                Text("quiz1")
            case .quiz2:
                Text("quiz2")
//                Quiz2View(viewModel: viewModel)
            case .toneTest:
                Text("tone")
//                ToneTestView(viewModel: viewModel)
            case .conversation:
                Text("convo")
//                ConversationView(viewModel: viewModel)
            case .completed:
                Text("Story Completed")
            }
            Button(action: {
                viewModel.moveToNextStage()
            }) {
                Text("Next")
            }
        }
        .onAppear {
            // Load stories and initialize
        }
    }
}

#Preview {
    StoryView()
}
