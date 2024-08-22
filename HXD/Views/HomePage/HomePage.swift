//
//  HomePage.swift
//  HXD
//
//  Created by Vincent Junior Halim on 15/08/24.
//

import Foundation
import SwiftUI

struct HomePage: View {
    @ObservedObject var homeViewModel: HomeViewModel
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text("Which story will you")
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                    Text("Explore today?")
                        .fontWeight(.bold)
                        .font(.system(size: 48))
                        .foregroundStyle(.white)
                }
                .frame(width: .infinity, height: geometry.size.height * 0.18)
                .padding(.trailing, 32)
                .padding(.bottom, 16)
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color(.white))
                        .clipShape(.rect(cornerRadius: 32))
                        .frame(maxHeight: .infinity)
                    ZStack {
                        HomeCardScrollView(homeViewModel: homeViewModel)
                    }
                    .padding(.bottom, 64)
                    .ignoresSafeArea()
                }
            }
        }
        .background(Image(.homeBackground))
        .ignoresSafeArea()
    }
}

#Preview {
    HomePage(homeViewModel: HomeViewModel())
}
