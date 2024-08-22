//
//  Initial.swift
//  HXD
//
//  Created by Vincent Junior Halim on 21/08/24.
//
import SwiftUI
import WrappingStack

struct Initial: View {
    let initials = ["b","p"]
    
    var body: some View {
        VStack(alignment:.center){
            Text("Learn Pin Yin")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 48))
                .foregroundStyle(.black)
            Image(.initial)
            Text("Try to tap these character to know how to pronounce it")
                .multilineTextAlignment(.center)
            WrappingHStack(id: \.self){
                ForEach(initials, id: \.self) { element in
                    VStack{
                        Text(element)
                        Button(action: {
                            
                        }, label: {
                            Image(.diceFive)
                        })
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.border, lineWidth: 1)
                    )
                    .padding()
                }
            }
        }
    }
}

#Preview {
    Initial()
}
