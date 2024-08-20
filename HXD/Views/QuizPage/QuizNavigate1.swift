//
//  QuizNavigate1.swift
//  HXD
//
//  Created by Ferdinand Jacques on 20/08/24.
//

import SwiftUI

struct QuizNavigate1: View {
    @ObservedObject var viewModel: StoryViewModel
    
    var body: some View {
        NavigationView {
            QuizPage(viewModel: viewModel)
        }
        .navigationBarHidden(true)
    }
}
