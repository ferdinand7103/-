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
            QuizHanzi(choice1: "成人", choice2: "周一", choice3: "猫", choice4: "日记")
                .padding(.top, 550)
                .padding([.leading, .trailing])
        }
    }
}

#Preview {
    QuizPage()
}
