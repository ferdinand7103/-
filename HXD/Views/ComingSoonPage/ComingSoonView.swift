//
//  ComingSoonView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 21/08/24.
//

import SwiftUI

struct ComingSoonView: View {
    var body: some View {
        VStack (spacing: 20){
            Image("comingSoon")
                .resizable()
                .frame(width: 200, height: 200)
            Text("Coming Soon")
                .fontWeight(.bold)
                .font(.system(size: 36))
                .foregroundStyle(.white)
        }
        .background(Image(.homeBackground))
        .ignoresSafeArea()
        
    }
}

#Preview {
    ComingSoonView()
}
