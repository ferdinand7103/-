//
//  LogoAnimation.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 19/08/24.
//

import SwiftUI

class LogoAnimation: ObservableObject, LogoAnimationProtocol {
    @Published var currentIndex = 0
    private let animationInterval = 0.5

    func startIntroducing(duration: Double) {
        let totalIntervals = Int(duration / animationInterval)
        animate(intervalsLeft: totalIntervals)
    }
    
    private func animate(intervalsLeft: Int) {
        guard intervalsLeft > 0 else {
            return
        }

        currentIndex = (currentIndex + 1) % 3
        
        DispatchQueue.main.asyncAfter(deadline: .now() + animationInterval) {
            self.animate(intervalsLeft: intervalsLeft - 1)
        }
    }
}
