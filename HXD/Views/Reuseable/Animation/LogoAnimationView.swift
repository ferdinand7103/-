//
//  LogoAnimation.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 19/08/24.
//

import SwiftUI

struct LogoAnimationView: View {
    @ObservedObject private var logoAnimation: LogoAnimation
    private let images: [String]

    init(images: [String], logoAnimation: LogoAnimation = LogoAnimation()) {
        self.images = images
        self.logoAnimation = logoAnimation
    }

    var body: some View {
        Image(images[logoAnimation.currentIndex])
            .resizable()
            .scaledToFit()
            .frame(width: 400, height: 392)
            .transition(.opacity)
            .animation(.none, value: logoAnimation.currentIndex)
    }
}

#Preview {
    LogoAnimationView(images: ["OrangeLeft", "OrangeRight", "OrangeMiddle"])
}
