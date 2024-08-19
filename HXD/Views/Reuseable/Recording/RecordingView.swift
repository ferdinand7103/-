//
//  RecordingView.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 18/08/24.
//

import SwiftUI

struct RecordingView: View {
    var body: some View {
            VStack {
                RecordViewWrapper()
                    .frame(width: 200, height: 200)
                    .padding()
            }.background(.black)
            .clipShape(.rect(cornerRadius: 24))
    }
}

#Preview {
    RecordingView()
}

