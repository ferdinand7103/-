//
//  ConfirmationView.swift
//  HXD
//
//  Created by Ferdinand Jacques on 14/08/24.
//

import SwiftUI

struct ConfirmationView: View {
    @Binding var isShowingConfirmation: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 313, height: 282)
                .foregroundColor(.white)
                .cornerRadius(16)
            VStack(alignment: .center) {
                Text("Are you sure you want")
                    .font(.system(size: 24, weight: .bold))
                Text("to leave this page?")
                    .font(.system(size: 24, weight: .bold))
                    .padding(.bottom, 15)
                Text("You'll need to start the story over")
                    .font(.system(size: 16))
                Text("from the beginning")
                    .font(.system(size: 16))
                    .padding(.bottom, 15)
                Button(action: {
                    print("leave")
                    isShowingConfirmation = false
                }) {
                    ZStack{
                        Rectangle()
                            .frame(width: 265, height: 43)
                            .cornerRadius(16)
                            .foregroundColor(.orange3)
                        Text("Leave")
                            .font(.system(size: 16))
                            .foregroundStyle(.white)
                    }
                }
                Button(action: {
                    print("back to story")
                    isShowingConfirmation = false
                }) {
                    ZStack{
                        Rectangle()
                            .frame(width: 265, height: 43)
                            .cornerRadius(16)
                            .foregroundColor(.white)
                        Text("Back to story")
                            .font(.system(size: 16))
                            .foregroundStyle(.orange3)
                    }
                }
            }
            .shadow(radius: 16)
        }
    }
}

#Preview {
    ConfirmationView(isShowingConfirmation: .constant(true))
}
