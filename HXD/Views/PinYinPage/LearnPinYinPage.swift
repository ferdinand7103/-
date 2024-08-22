//
//  LearnPinYinPage.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 22/08/24.
//

import SwiftUI

struct LearnPinYinPage: View {
    @ObservedObject var learnVM: LearnViewModel
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Rectangle()
                        .fill(Color.clear).frame(height: geometry.size.height * 0.3)

                    Rectangle()
                        .foregroundStyle(Color(.white))
                        .clipShape(.rect(cornerRadius: 32))
//                        .frame(maxHeight: 900)
                        .frame(height: geometry.size.height * 0.74)
                }
                ZStack {
                    LearnPinYinContents(viewModel: learnVM)
                        .frame(maxHeight: .infinity)

                }
                .background(Color.clear)

            }
            
        }
        .background(Image(.homeBackground))
    }
}

#Preview {
    LearnPinYinPage(learnVM: LearnViewModel())
}
