//
//  StoryView.swift
//  HXD
//
//  Created by Rama Eka Hartono on 19/08/24.
//

import SwiftUI

struct StoryView: View {
    @ObservedObject var viewModel = StoryViewModel()
    @StateObject private var talkingAnimation = TalkingAnimation()

    var body: some View {
        ForEach(0..<viewModel.stories.count, id: \.self) { index in
            Text(viewModel.stories[index].background)
        }
    }
}

#Preview {
    StoryView()
}
