//
//  HXDApp.swift
//  HXD
//
//  Created by Ferdinand Jacques on 01/08/24.
//

import SwiftUI

@main
struct HXDApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            FlashcardSwipeView()
//            QuizPage()
//            OnboardingPage()
//            RecordingView()
//            LogoAnimationView(images: ["OrangeLeft", "OrangeRight", "OrangeMiddle"])
//            TalkingView(images: ["Orange1","Orange2"])
            SplashScreenView()
//            Correct(hanzi: "猫", pinyin: "Māo", meaning: "Cat")
            StoryView()
        }
    }
}
