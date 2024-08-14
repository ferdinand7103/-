//
//  PrimaryButton.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 15/08/24.
//

import SwiftUI

struct PrimaryButton: View {
    var body: some View {
        Button(action: {
        }) {
            Text("I'm Ready!")
                .foregroundColor(.white)
                .frame(width: 320 , height: 20)
                .padding()
                .background(Color.orange3)
                .cornerRadius(10)
        }
        .padding(.top, 20)
    }
}

#Preview {
    PrimaryButton()
}
