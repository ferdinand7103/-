//
//  HandleButtonClick.swift
//  HXD
//
//  Created by Ferdinand Jacques on 13/08/24.
//

import SwiftUI

class HandleButtonClick: ObservableObject {
    @Published var clicked: Bool = false
    var correctAnswerIndex: Int
    
    @Published var foregroundColors: [Color] = [.black, .black, .black, .black]
    @ObservedObject var viewModel: StoryViewModel

    init(correctAnswerIndex: Int, viewModel: StoryViewModel) {
        self.correctAnswerIndex = correctAnswerIndex
        self.viewModel = viewModel
    }

    func handleButtonClick(index: Int, colors: inout [Color]) {
        for i in 0..<colors.count {
            colors[i] = .white
            foregroundColors[i] = .black
        }
        colors[index - 1] = .orange3
        foregroundColors[index - 1] = .white
        
        if ((index - 1) == correctAnswerIndex) {
            viewModel.quizView = "Correct"
            viewModel.quizView2 = "Correct"
        } else {
            viewModel.quizView = "Wrong"
            viewModel.quizView2 = "Wrong"
        }
    }
}
