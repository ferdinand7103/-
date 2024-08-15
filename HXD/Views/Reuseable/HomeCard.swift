//
//  HomeCard.swift
//  HXD
//
//  Created by Vincent Junior Halim on 15/08/24.
//

import Foundation
import SwiftUI

struct HomeCard: View {
    @State var homeCard : ImageResource
    @State var story: String
    @State var storyName: String
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                VStack(alignment:.leading){
                    Image(homeCard)
                    HStack{
                        Text(story)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 16))
                            .foregroundStyle(.white)
                        Spacer()
                        Text("Not Completed")
                            .foregroundStyle(.red)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 16))
                            .padding([.top,.bottom],8)
                            .padding([.trailing,.leading],12)
                            .background(.redLight)
                            .clipShape(.rect(cornerRadius: 24))
                            .padding(2)
                           
                    }
                    Text(storyName)
                        .font(.system(size: 24))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundStyle(.white)
                    RectangleButton(fontsize: 20,label: "Practice",width: 300,height: 20)
                }.padding()
                    .frame(width: 350)
                .background(.orange3)
                .clipShape(.rect(cornerRadius: 24))
            }.position(x:geometry.size.width/2,y:geometry.size.height*0.32)
        }
    }
}

#Preview {
    HomeCard(homeCard: .homeCard1, story: "Story 1", storyName: "Go to Chinese Hotpot\nRestaurant")
}
