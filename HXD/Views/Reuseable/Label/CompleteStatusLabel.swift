//
//  CompleteStatusLabel.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 21/08/24.
//

import SwiftUI

struct CompleteStatusLabel: View {
    @State var isComplete: Bool = false
    
    var body: some View {
        let labelText = isComplete ? "Completed" : "Not Completed"
        let foregroundColor = isComplete ? Color.green2 : Color.red
        let backgroundColor = isComplete ? Color.greenLight : Color.redLight
        
        Text(labelText)
            .foregroundStyle(foregroundColor)
            .fontWeight(/*@START_MENU_TOKEN@*/ .bold/*@END_MENU_TOKEN@*/)
            .font(.system(size: 16))
            .padding([.top, .bottom], 8)
            .padding([.trailing, .leading], 12)
            .background(backgroundColor)
            .clipShape(.rect(cornerRadius: 24))
            .padding(2)
    }
}

#Preview {
    CompleteStatusLabel(isComplete: false)
}
