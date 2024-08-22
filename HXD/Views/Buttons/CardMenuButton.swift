//
//  CardMenuButton.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 21/08/24.
//

import SwiftUI

struct CardMenuButton: View {
    var isDisabled: Bool = false
    var body: some View {
        Button(action: {

        }) {
            Rectangle()
                .fill(isDisabled ? Color.lighterGray : Color.gold2)
                .frame(width: 64, height: 64)
                .overlay(
                    Image("menuIcon")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .frame(width: 32, height: 32)
                        .foregroundStyle(isDisabled ? Color.lightGray : Color.orange3)
                )
                .cornerRadius(10)
        }
        .disabled(isDisabled)
    }

}

#Preview {
    CardMenuButton()
}
