//
//  PinYinExampleCard.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 22/08/24.
//

import SwiftUI

struct PinYinExampleCard: View {
    var body: some View {
        // Syllable
        VStack {
            HStack(spacing: 56) {
                HStack {
                    Image("initialN")
                    Image("finalI")
                }

                Image("characterNI")
                    .padding(.bottom, 40)
            }
            HStack(spacing: 0) {
                Text("Syllable")
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .bold()
                Text("Character")
                    .padding(.leading, 60)
                    .bold()
            }
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 12)
        .background(Color.white).clipShape(RoundedRectangle(cornerRadius: 24))
    }
}

#Preview {
    PinYinExampleCard()
}
