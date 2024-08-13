//
//  BackButton.swift
//  HXD
//
//  Created by Ferdinand Jacques on 13/08/24.
//

import SwiftUI

struct BackButton: View {
    let navigateTo: String

    var body: some View {
        Button(action: {
            print(navigateTo)
        }) {
            Rectangle()
                .fill(Color.backFlash)
                .frame(width: 40, height: 40)
                .overlay(
                    Image(systemName: "arrowshape.backward.fill")
                        .foregroundStyle(.white)
                        .font(.caption)
                )
                .cornerRadius(6)
        }
    }
}

#Preview {
    BackButton(navigateTo: "home")
}
