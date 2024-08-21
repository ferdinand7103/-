//
//  RecallView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 21/08/24.
//

import SwiftUI

struct RecallView: View {
    @StateObject var viewModel = StoryViewModel()

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Story 1")
                            .font(.system(size: 20))
                            .foregroundStyle(.white)
                        Spacer()
                        CompleteStatusLabel(isComplete: false)
                    }
                    
                    Text("Go to Chinese Hotpot Restaurant")
                        .fontWeight(.bold)
                        .font(.system(size: 28))
                        .foregroundStyle(.white)
                        .padding(.top, 2)
                    HStack {
                        InformationButton()
                            .padding(.top, 2)
                    }
                }
                .padding()
                .frame(height: geometry.size.height * 0.30)
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color(.white))
                        .clipShape(.rect(cornerRadius: 32))
//                        .position(x: geometry.size.width / 2, y: geometry.size.height * 0.46)
//                        .frame(height: geometry.size.height)
                        .frame(maxHeight: .infinity)

                    ZStack {
                        // List of Chapters
                        ScrollView(.vertical, showsIndicators: false) {
                            VStack(spacing: 24) {
                                ChapterCard(
                                    imageName: "SchoolChapter",
                                    chapterNumber: 1,
                                    chapterTitle: "At The School",
                                    options: ["Vocabulary", "Quiz", "Conversation"],
                                    selectedOption: 0, // Selected option for Vocabulary,
                                    isInactive: .constant(false),
                                    isFinished: .constant(true)
                                )

                                ChapterCard(
                                    imageName: "HaidilaoChapter",
                                    chapterNumber: 2,
                                    chapterTitle: "Arrive at Haidilao",
                                    options: ["Vocabulary", "Quiz", "Conversation"],
                                    selectedOption: 0, // Selected option for Vocabulary,
                                    isInactive: .constant(true),
                                    isFinished: .constant(false)
                                )

                                ChapterCard(
                                    imageName: "OrderChapter",
                                    chapterNumber: 3,
                                    chapterTitle: "Arrive at Restaurant",
                                    options: ["Vocabulary", "Quiz", "Conversation"],
                                    selectedOption: 0, // Selected option for Vocabulary,
                                    isInactive: .constant(true),
                                    isFinished: .constant(false)
                                )

                                ChapterCard(
                                    imageName: "SecretCodeChapter",
                                    chapterNumber: 4,
                                    chapterTitle: "Secret Code",
                                    options: ["Vocabulary", "Quiz", "Conversation"],
                                    selectedOption: 0, // Selected option for Vocabulary,
                                    isInactive: .constant(true),
                                    isFinished: .constant(false)
                                )
                            }
                            
                            .frame(minHeight: geometry.size.height * 0.7)
                        }
                        
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 36)
                    .padding(.bottom, 56)
                    .frame(height: geometry.size.height * 0.78)
                }
                
            }
        }
        .background(Image(.homeBackground))
       
    }
}

#Preview {
    RecallView()
}
