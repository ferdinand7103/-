//
//  CardMenuButton.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 21/08/24.
//

import SwiftUI

struct CardMenuButton: View {
    var body: some View {
        Button(action: {

        }) {
            Rectangle()
                .fill(Color.gold2)
                .frame(width: 64, height: 64)
                .overlay(
                    Image("menuIcon")
                        .foregroundStyle(.orange3)
                        .font(.system(size: 20))
                )
                .cornerRadius(10)
        }
    }
}

#Preview {
    CardMenuButton()
}
