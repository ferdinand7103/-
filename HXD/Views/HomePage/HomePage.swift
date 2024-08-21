//
//  HomePage.swift
//  HXD
//
//  Created by Vincent Junior Halim on 15/08/24.
//

import Foundation
import SwiftUI

struct HomePage: View {
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                VStack(alignment: .leading){
                    Text("Which story will you")
                        .font(.system(size:20))
                        .foregroundStyle(.white)
                    Text("Explore today?")
                        .fontWeight(.bold)
                        .font(.system(size:48))
                        .foregroundStyle(.white)
                    HStack{
                        RectangleButton(labelImage: .lightbulb, fontsize: 16,label: "Learn Pin Yin",width: 180,height: 12)
                        RectangleButton(labelImage: .diceFive, fontsize: 16,label: "Word of the Day",width: 180,height: 12)
                    }
                }
                .frame(height:geometry.size.height * 0.4)
                Rectangle()
                    .foregroundStyle(Color(.white))
                    .clipShape(.rect(cornerRadius: 32))
                    .position(x:geometry.size.width/2,y:geometry.size.height*0.42)
                    .frame(height:geometry.size.height)
                    .overlay {
                        HomeCard(homeCard: .homeCard1, story: "Story 1", storyName: "Go to Chinese Hotpot\nRestaurant")
                    }
            }.ignoresSafeArea(.all)
        }
        .background(Image(.homeBackground)
        )
    }
}

#Preview {
    HomePage()
}


