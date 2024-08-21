//
//  RecallView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 21/08/24.
//

import SwiftUI

struct RecallView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Back Button and Not Completed Label
            HStack {
                Button(action: {
                    // Back action
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text("Back")
                            .font(.system(size: 18, weight: .medium))
                    }
                }
                Spacer()
                Text("Not Completed")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 4)
                    .background(Color.red)
                    .cornerRadius(8)
            }
            
            // Story Title
            Text("Story 1")
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(Color.orange)
            
            Text("Go to Chinese Hotpot Restaurant")
                .font(.system(size: 26, weight: .bold))
                .foregroundColor(Color.primary)
            
            // Dictionary Button
            Button(action: {
                // Dictionary action
            }) {
                HStack {
                    Image(systemName: "book")
                    Text("Dictionary")
                        .font(.system(size: 18, weight: .bold))
                }
                .padding()
                .foregroundColor(.orange)
                .background(RoundedRectangle(cornerRadius: 12).fill(Color.yellow))
            }
            .padding(.top, 16)
            
            // List of Chapters
            VStack(spacing: 24) {
                ChapterCard(
                    imageName: "chapter1Image",
                    chapterNumber: 1,
                    chapterTitle: "At The School",
                    options: ["Vocabulary", "Quiz", "Conversation"],
                    selectedOption: 0, // Selected option for Vocabulary,
                    isInactive: .constant(false),
                    isFinished : .constant(true)
                )
                
                ChapterCard(
                    imageName: "chapter2Image",
                    chapterNumber: 2,
                    chapterTitle: "Arrive at Haidilao",
                    options: ["Vocabulary", "Quiz", "Conversation"],
                    selectedOption: 0, // Selected option for Vocabulary,
                    isInactive: .constant(true),
                    isFinished : .constant(false)
                )
            }
            
            Spacer()
        }
        .padding()
        .background(Color.orange.opacity(0.1))
    }
}

#Preview {
    RecallView()
}
