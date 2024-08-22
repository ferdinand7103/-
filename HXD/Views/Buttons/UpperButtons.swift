//
//  UpperButtons.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 14/08/24.
//

import SwiftUI

struct UpperButtons: View {
    @Binding var isShowingConfirmation: Bool
//    @Binding var isShowingFlashcard: Bool
    @Binding var isShowingDict: Bool
    @ObservedObject var viewModel: StoryViewModel
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    BackButton(isShowingConfirmation: $isShowingConfirmation, isShowingDict: $isShowingDict)
                    Spacer()
                    DictButton(isShowingDict: $isShowingDict, viewModel: viewModel)

                }
                .frame(width: UIScreen.main.bounds.width - 60, height: 85)
            }
            
        }
    }
}

#Preview {
    UpperButtons(isShowingConfirmation: .constant(false), isShowingDict: .constant(false), viewModel: StoryViewModel())
}
