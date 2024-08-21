//
//  PrimaryButton.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 21/08/24.
//

import SwiftUI

struct PrimaryButton: View {
    var body: some View {
        Button(action: {
        }) {
            ZStack {
                Rectangle()
                    .foregroundColor(Color.orange3)
                    .frame(width: 233, height: 64)
                    .cornerRadius(12)
                Text("Practice")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 20, weight: .bold))
            }
        }
    }
}

#Preview {
    PrimaryButton()
}
