//
//  BubbleSoundButton.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 20/08/24.
//

import SwiftUI

struct BubbleSoundButton: View {
    var icon: String
    var buttonAction: () -> Void

    var body: some View {
        Button(action: {
            buttonAction()
        }) {
            Rectangle()
                .fill(Color.orange3)
                .frame(width: 48, height: 48)
                .overlay(
                    Image(icon)
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                )
                .cornerRadius(16)
        }
    }
}

#Preview {
    BubbleSoundButton(
        icon: "sound",
        buttonAction: {
        }
    )
}
