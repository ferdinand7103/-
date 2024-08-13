//
//  TryAgainHanzi.swift
//  HXD
//
//  Created by Ferdinand Jacques on 09/08/24.
//

import SwiftUI

struct TryAgainHanzi: View {
    var hanzi: String
    var meaning: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.tryAgain)
                .frame(width: .infinity, height: 320)
                .cornerRadius(24)
            VStack {
                HStack {
                    Image(systemName: "cross.circle.fill")
                        .foregroundColor(Color.cross)
                        .font(.system(size: 20, weight: .bold))
                        .rotationEffect(.degrees(45))
                    Text("Try Again!")
                        .foregroundStyle(Color.cross)
                        .font(.system(size: 20, weight: .bold))
                }
                .padding(.trailing, 225)
                .padding(.bottom, 20)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Correct Answer:")
                        .font(.system(size: 20, weight: .bold))
                    Text(hanzi)
                        .font(.system(size: 20))
                    Text("Meaning:")
                        .font(.system(size: 20, weight: .bold))
                    Text(meaning)
                        .font(.system(size: 20))
                }
                .padding(.trailing, 190)
                .padding(.bottom, 20)
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.cross)
                        .frame(width: 350, height: 73)
                        .cornerRadius(12)
                    Text("Continue")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 30, weight: .bold))
                }
            }
        }
    }
}

#Preview {
    TryAgainHanzi(hanzi: "猫 Māo", meaning: "Cat")
}
