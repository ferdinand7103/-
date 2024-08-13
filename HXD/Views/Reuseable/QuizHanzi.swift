//
//  QuizHanzi.swift
//  HXD
//
//  Created by Ferdinand Jacques on 13/08/24.
//

import SwiftUI

struct QuizHanzi: View {
    let choice1, choice2, choice3, choice4: String
    @State var colors: [Color] = [Color.white, Color.white, Color.white, Color.white]
    
    @StateObject private var viewModel: HandleButtonClick

    init(choice1: String, choice2: String, choice3: String, choice4: String, correctAnswerIndex: Int) {
        self.choice1 = choice1
        self.choice2 = choice2
        self.choice3 = choice3
        self.choice4 = choice4
        _viewModel = StateObject(wrappedValue: HandleButtonClick(correctAnswerIndex: correctAnswerIndex))
    }

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
                .frame(width: .infinity, height: 300)
                .cornerRadius(24)
            VStack {
                Text("Choose The Answer")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(Color.black)
                    .padding(.bottom, 20)
                HStack {
                    Button(action: {
                        viewModel.handleButtonClick(index: 1, colors: &colors)
                    }) {
                        RectangleChoose(hanzi: choice1, fill: $colors[0])
                            .foregroundColor(viewModel.foregroundColors[0])
                    }
                    Button(action: {
                        viewModel.handleButtonClick(index: 2, colors: &colors)
                    }) {
                        RectangleChoose(hanzi: choice2, fill: $colors[1])
                            .foregroundColor(viewModel.foregroundColors[1])
                    }
                }
                HStack {
                    Button(action: {
                        viewModel.handleButtonClick(index: 3, colors: &colors)
                    }) {
                        RectangleChoose(hanzi: choice3, fill: $colors[2])
                            .foregroundColor(viewModel.foregroundColors[2])
                    }
                    Button(action: {
                        viewModel.handleButtonClick(index: 4, colors: &colors)
                    }) {
                        RectangleChoose(hanzi: choice4, fill: $colors[3])
                            .foregroundColor(viewModel.foregroundColors[3])
                    }
                }
            }
        }
    }
}

#Preview {
    QuizHanzi(choice1: "成人", choice2: "周一", choice3: "猫", choice4: "日记", correctAnswerIndex: 3)
}
