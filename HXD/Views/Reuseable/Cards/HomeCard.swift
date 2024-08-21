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
    @State var isDisabled: Bool
    
    var body: some View {
//        GeometryReader{ geometry in
//            ZStack{
                VStack(alignment:.leading){
                    Image("Story1Thumbnail")
                    HStack{
                        Text(story)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 16))
                            .foregroundStyle(.black)
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
                    .padding(.top, 10)
                    Text(storyName)
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                    HStack {
                        PrimaryButton(isDisabled: isDisabled)
                        CardMenuButton(isDisabled: isDisabled)
                    }
                    
                }.padding()
                    .frame(width: 350)
                .background(.white)
                .clipShape(.rect(cornerRadius: 24))
                .shadow(color: Color(red: 0.42, green: 0.21, blue: 0).opacity(0.2), radius: 9, x: 0, y: 0)
//            }
//            .position(x:geometry.size.width/2,y:geometry.size.height*0.32)
//        }
    }
}

#Preview {
    HomeCard(homeCard: .story1Thumbnail, story: "Story 1", storyName: "Go to Chinese Hotpot\nRestaurant", isDisabled: false)
}
