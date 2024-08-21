//
//  HomeCardScrollView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 21/08/24.
//

import SwiftUI

struct HomeCardScrollView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                HomeCard(homeCard: .story1Thumbnail, story: "Story 1", storyName: "Go to Chinese Hotpot\nRestaurant", isDisabled: false)
                HomeCard(homeCard: .story1Thumbnail, story: "Story 2", storyName: "Go to Market\n", isDisabled: true)
            }
            .frame(height: 600)
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    HomeCardScrollView()
}
