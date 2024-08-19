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
                        logoAnimation.startIntroducing(duration: 6)
                    }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
