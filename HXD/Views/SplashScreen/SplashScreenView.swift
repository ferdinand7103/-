//
//  SplashScreenView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 19/08/24.
//

import SwiftUI

struct SplashScreenView: View {
    @StateObject private var logoAnimation = LogoAnimation()
    @State private var showTagline = false

    var body: some View {
        ZStack {
            Color.gold1
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)
            VStack {
                LogoAnimationView(images: ["orangeLeft1", "orangeRight1", "orangeMiddle1"], logoAnimation: logoAnimation)
                    .onAppear {
                        logoAnimation.startIntroducing(duration: 2.8)
                    }
                    .onChange(of: logoAnimation.currentIndex) {
                        if logoAnimation.currentIndex == 2 {
                            withAnimation {
                                showTagline = true
                            }
                        }
                    }

                if showTagline {
                    Image("Tagline")
                        .resizable()
                        .scaleEffect(CGSize(width: 0.8, height: 0.8))
                        .scaledToFit()
                        .padding(.top, -200)
                        .frame(maxWidth: .infinity, maxHeight: 163, alignment: .center)
                        .transition(.opacity)
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
