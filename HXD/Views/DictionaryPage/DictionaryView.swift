//
//  DictionaryView.swift
//  HXD
//
//  Created by Rama Eka Hartono on 20/08/24.
//

import SwiftUI

struct DictionaryView: View {
    @Binding var isShowingDict : Bool
    @ObservedObject var viewModel: StoryViewModel
    
    var body: some View {
        NavigationView {
            ZStack{
                Rectangle()
                    .ignoresSafeArea()
                    .foregroundColor(.white)
                VStack {
                    Text("Dictionary")
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 16)
                        .foregroundColor(.black)
                    
                    Text("Story 1 - Chapter \(viewModel.currentStoryIndex + 1)")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 16)
                    
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        ForEach(0..<viewModel.currentStory.flashcard.count) { index in
                            ZStack {
                                FlashcardView(vocab: viewModel.currentStory.flashcard[index], width: 170, height: 236)
                                    .padding(0)
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(.gray, lineWidth: 2)
                                SoundButton(vocab: viewModel.currentStory.flashcard[index])
                                    .frame(width: 30, height: 30)
                                    .background(Color.white)
                                    .clipShape(Circle())
                                    .offset(x: 20, y: 75)
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    Spacer()
                }
                .navigationBarItems(leading: Button(action: {
                    isShowingDict = false
                    viewModel.showChoice = true
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                    }
                    .foregroundColor(.orange)
                })
            }
        }
    }
}



#Preview {
    DictionaryView(isShowingDict: .constant(true), viewModel: StoryViewModel())
    }

