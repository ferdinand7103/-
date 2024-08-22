//
//  LearnPinYinContents.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 22/08/24.
//

import SwiftUI

struct LearnPinYinContents: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Learn Pin Yin")
                    .fontWeight(.heavy)
                    .font(.system(size: 48))
                    .foregroundStyle(.white)
                    .padding(.top, 2)
                
                VStack(spacing: 40) {
                    PinYinExampleCard()
                    
                    VStack(spacing: 16) {
                        NavigationLink(destination: Initial()) {
                            PinYinNavigationButton(labelImage: .initialIcon, title: "Initial", content: "Initials are usually consonants")
                        }
                        NavigationLink(destination: Final()) {
                            PinYinNavigationButton(labelImage: .finalIcon, title: "Final", content: "Finals are usually made up of vowels")
                        }
                        NavigationLink(destination: PinYinTonePage()) {
                            PinYinNavigationButton(labelImage: .toneIcon, title: "Tone", content: "Tones differentiate word meanings")
                        }
                    }
                }
                .padding(.bottom, 56)
                .background(Color.clear)
            }
            .navigationBarTitleDisplayMode(.inline) // Add this to set the inline navigation title style
                        .toolbar { // Optional: add a back button or other toolbar items if necessary
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: {
                                    // Add back button action or leave default
                                }) {
                                    Image(systemName: "chevron.left")
                                }
                            }
                        }
                    }
                    .navigationViewStyle(StackNavigationViewStyle()) 
        
    }
}



#Preview {
    LearnPinYinContents()
}
