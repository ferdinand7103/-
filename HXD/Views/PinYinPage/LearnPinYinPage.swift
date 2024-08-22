//
//  LearnPinYinPage.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 22/08/24.
//

import SwiftUI

struct LearnPinYinPage: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                VStack(alignment: .center) {
                    Text("Learn Pin Yin")
                        .fontWeight(.heavy)
                        .font(.system(size: 48))
                        .foregroundStyle(.white)
                        .padding(.top, 2)
                }
                .padding()
                .frame(height: geometry.size.height * 0.30)
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color(.white))
                        .clipShape(.rect(cornerRadius: 32))
                        .frame(maxHeight: .infinity)

                    ZStack {
                        VStack (spacing: 16){
                            PinYinNavigationButton(labelImage: .initialIcon, title: "Initial", content: "Initials are usually consonants")
                            PinYinNavigationButton(labelImage: .finalIcon, title: "Final", content: "Finals are usually made up of vowels")
                            PinYinNavigationButton(labelImage: .toneIcon, title: "Tone", content: "Tones differentiate word meanings")
                        }
                       
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 36)
                    .padding(.bottom, 56)
                    .frame(height: geometry.size.height * 0.78)
                }
            }
        }
        .background(Image(.homeBackground))
    }
}

#Preview {
    LearnPinYinPage()
}
