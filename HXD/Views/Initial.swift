//
//  Initial.swift
//  HXD
//
//  Created by Ferdinand Jacques on 22/08/24.
//

import SwiftUI
import WrappingStack

struct Initial: View {
    @ObservedObject var viewModel: LearnViewModel
    
    var body: some View {
        VStack {
            Text("Pin Yin  Initial")
                .font(.system(size: 25, weight: .bold))
                .foregroundStyle(.black)
            Image("InitialN")
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
            Text("Try to tap these character to know how to")
                .font(.system(size: 18))
                .foregroundStyle(.black)
            Text("pronounce it")
                .font(.system(size: 18))
                .foregroundStyle(.black)
            VStack {
                WrappingHStack(id: \.self){
                    ForEach(0..<viewModel.pinyinInit.count, id: \.self){ element in
                        bpm(text: viewModel.pinyinInit[element].pinyin, speak:  viewModel.pinyinInit[element].sound)
                            .padding(5)
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.bottom, 20)
        }
        .background(.white)
        .ignoresSafeArea()
    }
}

#Preview {
    Initial(viewModel: LearnViewModel())
}
