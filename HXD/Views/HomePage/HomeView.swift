//
//  HomeView.swift
//  HXD
//
//  Created by Ferdinand Jacques on 22/08/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @ObservedObject var viewModel: StoryViewModel
    
    var body: some View {
        VStack {
            if viewModel.recall == "Home" {
                TabBarView(homeViewModel:homeViewModel, viewModel: viewModel)
            } else {
                RecallView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    HomeView(homeViewModel: HomeViewModel(), viewModel: StoryViewModel())
}
