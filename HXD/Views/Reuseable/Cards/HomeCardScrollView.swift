//
//  HomeCardScrollView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 21/08/24.
//

import SwiftUI

struct HomeCardScrollView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                HomeCard(homeViewModel: homeViewModel,homeCard: .story1Thumbnail, story: "Story 1", storyName: "Go to Chinese Hotpot\nRestaurant", isDisabled: false, isComplete: false)
                HomeCard(homeViewModel:homeViewModel, homeCard: .story2Thumbnail, story: "Story 2", storyName: "Go to Market\n", isDisabled: true, isComplete: false)
            }
            .frame(height: 600)
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    HomeCardScrollView(homeViewModel: HomeViewModel())
}
