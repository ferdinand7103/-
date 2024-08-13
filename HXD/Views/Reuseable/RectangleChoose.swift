//
//  RectangleChoose.swift
//  HXD
//
//  Created by Ferdinand Jacques on 13/08/24.
//

import SwiftUI

struct RectangleChoose: View {
    @State var hanzi: String
    @State var pinyin: String? = nil
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.white)
                .frame(width: 182, height: 72)
                .cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.orange1, lineWidth: 2)
                )
            if pinyin != nil {
                VStack {
                    Text(hanzi)
                        .font(.system(size: 20))
                    Text(pinyin ?? "-")
                        .font(.system(size: 20))
                }
            } else {
                Text(hanzi)
                    .font(.system(size: 20))
            }
        }
    }
}

#Preview {
    RectangleChoose(hanzi: "成人", pinyin: "Zàijiàn")
}
