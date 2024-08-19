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
     Text("hell")

    }
}

#Preview {
    StoryView()
}
