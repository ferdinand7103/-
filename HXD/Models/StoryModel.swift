//
//  StoryModel.swift
//  HXD
//
//  Created by Ferdinand Jacques on 15/08/24.
//

import Foundation

struct StoryData: Codable {
    var story1: Story
    var story2: Story
    var story3: Story
    var story4: Story
}

struct Story: Codable {
    var background: String
    var onboarding: Onboarding
    var flashcard: [String]
    var quiz1: Quiz
    var quiz2: Quiz
    var toneTest: ToneTest
    var conversation: [String: ConversationPart]
}

struct Onboarding: Codable {
    var a: String
    var b: String
}

struct Quiz: Codable {
    var text: String
    var choice: [String: [String]]
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
    var hanzi: String
    var pinyin: String
    var meaning: String
}
