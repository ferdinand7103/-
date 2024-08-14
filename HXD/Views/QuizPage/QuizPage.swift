//
//  QuizPage.swift
//  HXD
//
//  Created by Ferdinand Jacques on 13/08/24.
//

import SwiftUI

struct QuizPage: View {
    var body: some View {
        ZStack {
            Image("QuizStart")
                .padding(.bottom, 195)
            BackButton(navigateTo: "home")
                .padding(.bottom, 680)
                .padding(.trailing, 290)
            FlashcardButton()
                .padding(.bottom, 680)
                .padding(.leading, 290)
            QuizHanzi(choice1: "再见", choice2: "欢迎", choice3: "你好", choice4: "请问", pinyin1: "Zàijiàn", pinyin2: "Huānyíng", pinyin3: "Nǐ hǎo", pinyin4: "Qǐng wèn", correctAnswerIndex: 3)
                .padding(.top, 525)
                .padding([.leading, .trailing])
        }
    }
}

#Preview {
    QuizPage()
}
