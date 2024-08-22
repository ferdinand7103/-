//
//  LearnView.swift
//  HXD
//
//  Created by Ferdinand Jacques on 22/08/24.
//

import SwiftUI

struct LearnView: View {
    @StateObject private var viewModel = LearnViewModel()
    
    var body: some View {
        VStack {
            switch viewModel.currentStage {
            case .front:
                LearnPinYinPage(learnVM: viewModel)
            case .initial:
                Initial(viewModel: viewModel)
            case .final:
                Final(viewModel: viewModel)
            case .tone:
                PinYinToneView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    LearnView()
}
