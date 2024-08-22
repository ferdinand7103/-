//
//  PrimaryButton.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 21/08/24.
//

import SwiftUI

struct PrimaryButton: View {
    var isDisabled: Bool = false

    var body: some View {
        Button(action: {}) {
            ZStack {
                Rectangle()
                    .foregroundColor(isDisabled ? Color.lighterGray : Color.orange3)
                    .frame(width: 233, height: 64)
                    .cornerRadius(12)
                Text("Practice")
                    .foregroundStyle(isDisabled ? Color.lightGray : Color.white)
                    .font(.system(size: 20, weight: .bold))
            }
        }
        .disabled(isDisabled)
    }
}

#Preview {
    PrimaryButton()
}
