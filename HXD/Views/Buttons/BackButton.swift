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
    BackButton(navigateTo: "home")
}
