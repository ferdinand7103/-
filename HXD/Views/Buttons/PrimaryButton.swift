//
//  PrimaryButton.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 21/08/24.
//

import SwiftUI

struct PrimaryButton: View {
    @ObservedObject var homeViewModel: HomeViewModel
    var isDisabled: Bool = false

    var body: some View {
        Button(action: { homeViewModel.switchStage(to: .story)}) {
            ZStack {
                Rectangle()
                    .foregroundColor(isDisabled ? Color(red: 0.9, green: 0.9, blue: 0.9) : Color.orange3)
                    .frame(width: 233, height: 64)
                    .cornerRadius(12)
                Text("Practice")
                    .foregroundStyle(isDisabled ? Color(red: 0.7, green: 0.7, blue: 0.7) : Color.white)
                    .font(.system(size: 20, weight: .bold))
            }
        }
        .disabled(isDisabled)
    }
}

#Preview {
    PrimaryButton(homeViewModel: HomeViewModel())
}
