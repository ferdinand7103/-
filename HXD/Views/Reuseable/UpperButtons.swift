//
//  UpperButtons.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 14/08/24.
//

import SwiftUI

struct UpperButtons: View {
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    BackButton(navigateTo: "home")
                    Spacer()
                    FlashcardButton(navigateTo: "Flashcard")

                }
                .padding(.horizontal, 27)
                .padding(.top, 16)
                Spacer()
            }
        }
    }
}

#Preview {
    UpperButtons()
}
