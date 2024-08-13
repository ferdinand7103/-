//
//  View.swift
//  HXD
//
//  Created by Ferdinand Jacques on 01/08/24.
//

import SwiftUI

struct Amazing: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.amazing)
                .frame(width: .infinity, height: 193)
                .cornerRadius(24)
            VStack {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundColor(Color.check)
                        .font(.system(size: 20, weight: .bold))
                    Text("Amazing!")
                        .foregroundStyle(Color.check)
                        .font(.system(size: 20, weight: .bold))
                }
                .padding(.trailing, 230)
                .padding(.bottom, 10)
                ZStack {
                    Rectangle()
                        .foregroundColor(Color.check)
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
    Amazing()
}
