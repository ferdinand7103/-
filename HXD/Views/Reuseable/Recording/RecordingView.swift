//
//  RecordingView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 18/08/24.
//

import SwiftUI

struct RecordingView: View {
    var mode: RecordingMode
    @ObservedObject var viewModel: StoryViewModel
    @ObservedObject var homeVM: HomeViewModel
    
    var body: some View {
         ZStack {
//            Rectangle()
//                .foregroundColor(Color.blue)
//                .frame(width: .infinity, height: 300)
//                .cornerRadius(24)
            VStack {
                RecordViewWrapper(mode: mode, viewModel: viewModel, homeVM: homeVM)
                    .frame(width: 300, height: 250)
            }
            .padding()
        }
    }
}

#Preview {
    RecordingView(mode: .conversation, viewModel: StoryViewModel(), homeVM: HomeViewModel())
}
