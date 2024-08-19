//
//  LogoAnimationProtocol.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 19/08/24.
//

import Foundation

protocol LogoAnimationProtocol {
    var currentIndex: Int { get }
    func startIntroducing(duration: Double)
}
