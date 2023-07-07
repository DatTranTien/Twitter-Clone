//
//  MenuButton.swift
//  TwitterClone
//
//  Created by Admin on 05/07/2023.
//

import SwiftUI

struct MenuButton: View {
    var title: String
    var body: some View {
        HStack(spacing: 15, content: {
            Image(title)
                .resizable()
                .renderingMode(.template)
                .frame(width: 24, height: 24)
//                .foregroundColor(.gray)
            
            Text(title)
                .foregroundColor(.black)
            
            Spacer()
        }).padding(.vertical, 12)
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        MenuButton(title: "sssss")
    }
}
