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
    @State var pinyin1: String? = nil
    @State var pinyin2: String? = nil
    @State var pinyin3: String? = nil
    @State var pinyin4: String? = nil
    
    @StateObject private var viewModel: HandleButtonClick

    init(choice1: String, choice2: String, choice3: String, choice4: String, correctAnswerIndex: Int) {
        self.choice1 = choice1
        self.choice2 = choice2
        self.choice3 = choice3
        self.choice4 = choice4
        _viewModel = StateObject(wrappedValue: HandleButtonClick(correctAnswerIndex: correctAnswerIndex))
    }

    init(choice1: String, choice2: String, choice3: String, choice4: String, pinyin1: String, pinyin2: String, pinyin3: String, pinyin4: String, correctAnswerIndex: Int) {
        self.choice1 = choice1
        self.choice2 = choice2
        self.choice3 = choice3
        self.choice4 = choice4
        self.pinyin1 = pinyin1
        self.pinyin2 = pinyin2
        self.pinyin3 = pinyin3
        self.pinyin4 = pinyin4
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
                        if (pinyin1 != nil) {
                            RectangleChoose(hanzi: choice1, pinyin: pinyin1, fill: $colors[0])
                                .foregroundColor(viewModel.foregroundColors[0])
                        } else {
                            RectangleChoose(hanzi: choice1, fill: $colors[0])
                                .foregroundColor(viewModel.foregroundColors[0])
                        }
                    }
                    Button(action: {
                        viewModel.handleButtonClick(index: 2, colors: &colors)
                    }) {
                        if (pinyin2 != nil) {
                            RectangleChoose(hanzi: choice2, pinyin: pinyin2, fill: $colors[0])
                                .foregroundColor(viewModel.foregroundColors[0])
                        } else {
                            RectangleChoose(hanzi: choice2, fill: $colors[0])
                                .foregroundColor(viewModel.foregroundColors[0])
                        }
                    }
                }
                HStack {
                    Button(action: {
                        viewModel.handleButtonClick(index: 3, colors: &colors)
                    }) {
                        if (pinyin3 != nil) {
                            RectangleChoose(hanzi: choice3, pinyin: pinyin3, fill: $colors[0])
                                .foregroundColor(viewModel.foregroundColors[0])
                        } else {
                            RectangleChoose(hanzi: choice3, fill: $colors[0])
                                .foregroundColor(viewModel.foregroundColors[0])
                        }
                    }
                    Button(action: {
                        viewModel.handleButtonClick(index: 4, colors: &colors)
                    }) {
                        if (pinyin4 != nil) {
                            RectangleChoose(hanzi: choice4, pinyin: pinyin4, fill: $colors[0])
                                .foregroundColor(viewModel.foregroundColors[0])
                        } else {
                            RectangleChoose(hanzi: choice4, fill: $colors[0])
                                .foregroundColor(viewModel.foregroundColors[0])
                        }
                    }
                }
            }
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    QuizHanzi(choice1: "成人", choice2: "周一", choice3: "猫", choice4: "日记", correctAnswerIndex: 3)
}
