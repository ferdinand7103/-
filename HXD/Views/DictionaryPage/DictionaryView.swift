//
//  DictionaryView.swift
//  HXD
//
//  Created by Rama Eka Hartono on 20/08/24.
//

import SwiftUI

struct DictionaryView: View {
    @ObservedObject var viewModel: StoryViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Dictionary")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 16)
                
                Text("Story 1 - Chapter 2")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 16)
                

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                    ForEach(0..<viewModel.currentStory.flashcard.count) { index in
                        ZStack {
                            FlashcardView(vocab: viewModel.currentStory.flashcard[index], width: 170, height: 236)
                                .padding(0)
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(.lighterGray, lineWidth: 1)
                            SoundButton(vocab: viewModel.currentStory.flashcard[index])
                                .frame(width: 30, height: 30)
                                .background(Color.white)
                                .clipShape(Circle())
                                .offset(x: 20, y: 75) // Position the button on the bottom-right corner
                        }
                    }
                }
                .padding(.horizontal, 16)
                
                Spacer()
            }
            .navigationBarItems(leading: Button(action: {
                // Handle the back button action here
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



#Preview {
        DictionaryView(viewModel: StoryViewModel())
    }

