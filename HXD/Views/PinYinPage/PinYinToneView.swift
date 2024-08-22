//
//  PinYinToneView.swift
//  HXD
//
//  Created by Ferdinand Jacques on 22/08/24.
//

import SwiftUI

struct PinYinToneView: View {
    @ObservedObject var viewModel: LearnViewModel
    @State private var selectedPage = 0
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // Action for the back button
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.orange)
                    Text("Back")
                        .foregroundColor(.orange)
                }
                Spacer()
            }
            .padding(.leading)
            TabView(selection: $selectedPage) {
                ForEach(0..<viewModel.tones.count, id: \.self) { index in
                    PinYinTonePage(
                        image: "tone\(index)",
                        nada: viewModel.tones[index].jenis,
                        desc: viewModel.tones[index].desc,
                        hanzi: viewModel.tones[index].hanzi,
                        pinyin: viewModel.tones[index].pinyin,
                        meaning: viewModel.tones[index].mean
                    )
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            HStack {
                ForEach(0..<viewModel.tones.count, id: \.self) { index in
                    Circle()
                        .fill(index == selectedPage ? Color.orange : Color.orange.opacity(0.5))
                        .frame(width: 10, height: 10)
                }
            }
            .padding(.top, 20)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    PinYinToneView(viewModel: LearnViewModel())
}
