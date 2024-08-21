//
//  HXDView.swift
//  HXD
//
//  Created by Ferdinand Jacques on 21/08/24.
//

import SwiftUI

struct HXDView: View {
    @State var Opacity: Double = 0.0
    
    var body: some View {
        ZStack {
            SplashScreenView()
            HomePage()
                .opacity(Opacity)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation(.easeIn(duration: 0.5)) {
                            Opacity = 1.0
                        }
                    }
                }
        }
    }
}

#Preview {
    HXDView()
}
