//
//  InformationButton.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 21/08/24.
//

import SwiftUI

struct InformationButton: View {
    var body: some View {
        Button(action: {
        }) {
            HStack {
                Image("Flashcard")
                Text("Dictionary")
                    .font(.system(size: 18, weight: .bold))
            }
            .padding(.vertical, 14.5)
            .padding(.horizontal, 16)
            .foregroundColor(.orange)
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.gold2))
        }
        
    }
}

#Preview {
    InformationButton()
}
