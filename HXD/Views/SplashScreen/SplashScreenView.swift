//
//  SplashScreenView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 19/08/24.
//

import SwiftUI

struct SplashScreenView: View {
    @StateObject private var logoAnimation = LogoAnimation()

    var body: some View {
        ZStack {
            Color.gold1
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                LogoAnimationView(images: ["OrangeLeft","OrangeRight", "OrangeMiddle"],logoAnimation: logoAnimation)
                    .onAppear {
                        logoAnimation.startIntroducing(duration: 2.8)
                    }
                
                Image("Tagline").resizable()
                    .frame(width: 390, height: 163)
                    .scaleEffect(CGSize(width: 0.8, height: 0.8))
                    .scaledToFit()
                    .padding(.top, -100)
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
