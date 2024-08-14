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
                    FlashcardButton()

                }
                .frame(width: UIScreen.main.bounds.width - 60, height: 85)
                Spacer()
            }
            
        }
    }
}

#Preview {
    UpperButtons()
}
