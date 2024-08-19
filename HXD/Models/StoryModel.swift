//
//  StoryModel.swift
//  HXD
//
//  Created by Ferdinand Jacques on 15/08/24.
//

import Foundation

struct StoryData: Codable {
    var stories: [Story]
}

struct Story: Codable {
    var background: String
    var onboarding: [OnboardingEntry]
    var flashcard: [String]
    var quiz1: Quiz1
    var quiz2: Quiz2
    var toneTest: ToneTest
    var conversation: [ConversationPart]
}

struct OnboardingEntry: Codable {
    var identifier: String
    var text: String
}

struct Quiz1: Codable {
    var text: String
    var choice: [QuizChoice]
    var correctAnswer: Int
    var happyFlow: String
    var negativeFlow: String
}

struct QuizChoice: Codable {
    var text: String
    var pinyin: String
}

struct Quiz2: Codable {
    var text: String
    var speak: String
    var choice: [String]
    var correctAnswer: Int
    var happyFlow: String
    var negativeFlow: String
}

struct ToneTest: Codable {
    var text: String
    var speak: String
    var happyFlow: String
    var negativeFlow: String
}

struct ConversationPart: Codable {
    var identifier: String
    var hanzi: String
    var pinyin: String
    var meaning: String
}
