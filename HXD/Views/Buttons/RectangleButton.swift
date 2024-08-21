//
//  RectangleButton.swift
//  HXD
//
//  Created by Vincent Junior Halim on 15/08/24.
//

import Foundation
import SwiftUI

struct RectangleButton: View {
    @State var labelImage:ImageResource?
    @State var fontsize: CGFloat
    @State var label:String
    @State var width: CGFloat
    @State var height: CGFloat
    var body: some View {
        HStack{
            if let image = labelImage {
                Image(image)
            }
            Text(label)
                .font(.system(size: fontsize))
                .fontWeight(.bold)
                .foregroundStyle(.orange3)
        }.frame(width: width)
            .padding([.top,.bottom],height)
            .background(.gold2)
            .clipShape(.rect(cornerRadius: 12))
    }
}

#Preview {
    RectangleButton(fontsize: 16, label: "Word of the Day",width: 200,height: 12)
}
