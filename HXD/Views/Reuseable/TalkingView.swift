//
//  TalkingView.swift
//  HXD
//
//  Created by Ferdinand Jacques on 14/08/24.
//

import SwiftUI

struct TalkingView: View {
    @ObservedObject private var talkingAnimation: TalkingAnimation
    private let images = ["Orange1", "Orange2"]

    init(talkingAnimation: TalkingAnimation = TalkingAnimation()) {
        self.talkingAnimation = talkingAnimation
    }
    
    var body: some View {
        Image(images[talkingAnimation.isTalking ? 1 : 0])
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
    }
}

#Preview {
    TalkingView()
}
