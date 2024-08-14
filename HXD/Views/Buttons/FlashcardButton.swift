//
//  FlashcardButton.swift
//  HXD
//
//  Created by Ferdinand Jacques on 14/08/24.
//

import SwiftUI

struct FlashcardButton: View {

    var body: some View {
        Button(action: {
            FlashcardSwipeView()
        }) {
            Rectangle()
                .fill(Color.orange3)
                .frame(width: 50, height: 50)
                .overlay(
                    Image(systemName: "rectangle.on.rectangle")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .bold))
                )
                .cornerRadius(10)
        }
    }
}

#Preview {
    FlashcardButton()
}
