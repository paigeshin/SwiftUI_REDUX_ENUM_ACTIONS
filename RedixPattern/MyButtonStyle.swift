//
//  MyButtonStyle.swift
//  RedixPattern
//
//  Created by paige shin on 2022/11/09.
//

import SwiftUI

struct MyButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .font(.system(size: 20))
            .padding()
            .background(Color.brown)
            .foregroundColor(.white)
            .cornerRadius(20)
    }
    
}

struct MyButtonStyle_Previews: PreviewProvider {
    
    static var previews: some View {
        Button {
            
        } label: {
            Text("Hello")
        }
        .buttonStyle(MyButtonStyle())

    }
    
}
