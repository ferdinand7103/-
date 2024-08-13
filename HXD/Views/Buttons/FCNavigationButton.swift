//
//  PreviousButton.swift
//  HXD
//
//  Created by Michelle Angela Aryanto on 13/08/24.
//

import SwiftUI

struct PreviousButton: View {
    var body: some View {
        Button(action: {}, label: {
            Label("Previous", image: "previousIcon")
                .modifier(ButtonTextModifier())

        })
        .modifier(ButtonModifier())
    }
}

struct NextButton: View {
    var body: some View {
        Button(action: {}, label: {
            Label("Next", image: "nextIcon")
                .modifier(ButtonTextModifier())

        })
        .labelStyle(TrailingIconLabelStyle())
        .modifier(ButtonModifier())
    }
}

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

struct ButtonTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.callout)
            .fontWeight(.medium)
            .foregroundStyle(Color(.orange3))
    }
}

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color(.gold2))
            .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
//    PreviousButton()
    NextButton()
}
