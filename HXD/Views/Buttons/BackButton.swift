//
//  BackButton.swift
//  HXD
//
//  Created by Ferdinand Jacques on 13/08/24.
//

import SwiftUI

struct BackButton: View {
    @Binding var isShowingConfirmation: Bool
    @Binding var isShowingFlashcard: Bool

    var body: some View {
        Button(action: {
            if isShowingFlashcard {
                isShowingFlashcard = false
            } else {
                isShowingConfirmation = true
            }
        }) {
            Rectangle()
                .fill(Color.orange3)
                .frame(width: 50, height: 50)
                .overlay(
                    Image(systemName: "arrowshape.backward.fill")
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                )
                .cornerRadius(10)
        }
    }
}

#Preview {
    BackButton(isShowingConfirmation: .constant(false), isShowingFlashcard: .constant(false))
}
