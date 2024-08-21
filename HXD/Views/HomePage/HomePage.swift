//
//  HomePage.swift
//  HXD
//
//  Created by Vincent Junior Halim on 15/08/24.
//

import Foundation
import SwiftUI

struct HomePage: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack(alignment: .leading) {
                    Text("Which story will you")
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                    Text("Explore today?")
                        .fontWeight(.bold)
                        .font(.system(size: 48))
                        .foregroundStyle(.white)
                }
                .frame(height: geometry.size.height * 0.25)
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color(.white))
                        .clipShape(.rect(cornerRadius: 32))
//                        .position(x: geometry.size.width / 2, y: geometry.size.height * 0.42)
                        .frame(maxHeight: .infinity)
                    ZStack {
                        HomeCardScrollView()
                    }
                    .ignoresSafeArea()
                }
            }
            .ignoresSafeArea(.all)
        }
        .background(Image(.homeBackground))
        .ignoresSafeArea()
    }
}

#Preview {
    HomePage()
}
