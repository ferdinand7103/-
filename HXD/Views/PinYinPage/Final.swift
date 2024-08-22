//
//  Final.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 22/08/24.
//

import SwiftUI
import WrappingStack

struct Final: View {
    @ObservedObject var viewModel: LearnViewModel
    
    var body: some View {
        VStack {
            // This HStack will stick to the top
            HStack {
                Button(action: {
                    viewModel.switchStage(to: .front)
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.orange)
                        Text("Back")
                            .foregroundColor(.orange)
                    }
                }
                Spacer()
            }
            .padding(.leading)
            .padding(.top) // Optional: Add padding to give some space from the top
            .background(Color.white) // Ensure the background matches your desired background
            
            // The rest of the content
            ScrollView { // Wrapping the main content in a ScrollView if content is large
                VStack {
                    Text("Pin Yin Final")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundStyle(.black)
                        .padding(15)
                    Image("final")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(15)
                    Text("Try to tap these character to know how to")
                        .font(.system(size: 18))
                        .foregroundStyle(.black)
                    Text("pronounce it")
                        .font(.system(size: 18))
                        .foregroundStyle(.black)
                        .padding(.bottom, 10)
                    VStack {
                        WrappingHStack(id: \.self){
                            ForEach(0..<viewModel.pinyinFinal.count, id: \.self) { element in
                                bpm(text: viewModel.pinyinFinal[element].pinyin, speak:  viewModel.pinyinFinal[element].sound)
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
    }
}

#Preview {
    Final(viewModel: LearnViewModel())
}
