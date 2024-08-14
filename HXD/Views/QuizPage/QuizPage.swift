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
            QuizTop()
            QuizHanzi(choice1: "再见", choice2: "欢迎", choice3: "你好", choice4: "请问", pinyin1: "Zàijiàn", pinyin2: "Huānyíng", pinyin3: "Nǐ hǎo", pinyin4: "Qǐng wèn", correctAnswerIndex: 3)
                .padding(.top, 550)
                .padding([.leading, .trailing])
        }
    }
}

#Preview {
    QuizPage()
}
