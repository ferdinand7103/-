//
//  QuizHanzi.swift
//  HXD
//
//  Created by Ferdinand Jacques on 13/08/24.
//

import SwiftUI

struct QuizHanzi: View {
    let choice1: String
    let choice2: String
    let choice3: String
    let choice4: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
                .frame(width: .infinity, height: 280)
                .cornerRadius(24)
            VStack {
                Text("Choose The Answer")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(Color.black)
                    .padding(.bottom, 20)
                HStack {
                    RectangleChoose(hanzi: choice1)
                    RectangleChoose(hanzi: choice2)
                }
                HStack {
                    RectangleChoose(hanzi: choice3)
                    RectangleChoose(hanzi: choice4)
                }
            }
        }
    }
}

#Preview {
    QuizHanzi(choice1: "成人", choice2: "周一", choice3: "猫", choice4: "日记")
}
