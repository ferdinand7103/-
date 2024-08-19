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
//                OnboardingView(viewModel: viewModel)
                Text(viewModel.currentStory.onboarding[viewModel.currentOnboardingIndex].identifier)
                Text(viewModel.currentStory.onboarding[viewModel.currentOnboardingIndex].text)
            case .flashcard:
//                FlashcardView(vocab: String, viewModel: viewModel)
                Text(viewModel.currentStory.flashcard[viewModel.currentFlashcardIndex])
                Text("flash")
            case .quiz1:
//                Quiz1View(viewModel: viewModel)
                Text(viewModel.currentStory.quiz1.text)
                ForEach(viewModel.currentStory.quiz1.choice.indices, id: \.self) { index in
                    VStack {
                        Text(viewModel.currentStory.quiz1.choice[index].text)
                        Text(viewModel.currentStory.quiz1.choice[index].pinyin)
                    }
                }

                Text("quiz1")
            case .quiz2:
                Text(viewModel.currentStory.quiz2.text)
                Text(viewModel.currentStory.quiz2.speak)
                ForEach(viewModel.currentStory.quiz1.choice.indices, id: \.self) { index in
                    VStack {
                   
                        Text(viewModel.currentStory.quiz2.choice[index])
                    }
                }
                Text("quiz2")
//                Quiz2View(viewModel: viewModel)
            case .toneTest:
                Text(viewModel.currentStory.toneTest.text)
                Text(viewModel.currentStory.toneTest.speak)
                Text("tone")
//                ToneTestView(viewModel: viewModel)
            case .conversation:
                Text("convo")
                Text(viewModel.currentStory.conversation[viewModel.currentConversationIndex].hanzi)
                Text(viewModel.currentStory.conversation[viewModel.currentConversationIndex].pinyin)
                Text(viewModel.currentStory.conversation[viewModel.currentConversationIndex].meaning)
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
