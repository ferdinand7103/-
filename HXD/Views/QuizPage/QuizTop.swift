//
//  QuizTop.swift
//  HXD
//
//  Created by Ferdinand Jacques on 14/08/24.
//

import SwiftUI

struct QuizTop: View {
    @State private var isShowingConfirmation: Bool = false
    @StateObject private var talkingAnimation = TalkingAnimation()
    
    var body: some View {
        ZStack{
            Image("QuizStart")
                .padding(.bottom, 195)
            UpperButtons(isShowingConfirmation: $isShowingConfirmation)
                .padding(.bottom, 680)
            if isShowingConfirmation {
                Color.black.opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                
                ConfirmationView(isShowingConfirmation: $isShowingConfirmation)
                    .frame(width: 313, height: 282)
                    .transition(.scale)
                    .zIndex(1)
                    .padding(.bottom, 85)
            }
            TalkingView(talkingAnimation: talkingAnimation)
                .onAppear {
                    talkingAnimation.startTalking(duration: 5)
                }
                .padding(.trailing, 190)
                .padding(.bottom, 100)
            Image("OrangeStay")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.leading, 190)
                .padding(.bottom, 100)
        }
        .animation(.easeInOut, value: isShowingConfirmation)
    }
}

#Preview {
    QuizTop()
}
