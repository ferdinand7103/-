//
//  LearnPinYinContents.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 22/08/24.
//

import SwiftUI

struct LearnPinYinContents: View {
    var body: some View {
        ZStack {
            VStack(spacing: 32) {
                Text("Learn Pin Yin")
                    .fontWeight(.heavy)
                    .font(.system(size: 48))
                    .foregroundStyle(.white)
                    .padding(.top, 2)

                PinYinExampleCard()

                VStack(spacing: 16) {
                    Button(action: {}) {
                        PinYinNavigationButton(labelImage: .initialIcon, title: "Initial", content: "Initials are usually consonants")
                    }

                    Button(action: {}) {
                        PinYinNavigationButton(labelImage: .finalIcon, title: "Final", content: "Finals are usually made up of vowels")
                    }

                    Button(action: {}) {
                        PinYinNavigationButton(labelImage: .toneIcon, title: "Tone", content: "Tones differentiate word meanings")
                    }
                }
                .padding(.bottom, 56)
                .background(Color.clear)
            }
        }
        .background(Image(.pinyinBackground))
    }
}

#Preview {
    LearnPinYinContents()
}
