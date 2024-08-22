//
//  LearnPinYinPage.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 22/08/24.
//

import SwiftUI

struct LearnPinYinPage: View {
    var body: some View {
        ZStack {
                    // Background Image
                    Image("pinyinBackground")
                        .resizable()
                        .scaledToFill() // Ensure the image fills the background
                        .edgesIgnoringSafeArea(.all) // Makes sure the image covers the entire screen
                    
                    // Content
                    LearnPinYinContents()
                        .background() // Ensures background of the content is transparent
                }
    }
}

#Preview {
    LearnPinYinPage()
}
