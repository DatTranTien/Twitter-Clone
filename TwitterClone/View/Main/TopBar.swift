//
//  TopBar.swift
//  TwitterClone
//
//  Created by Admin on 04/07/2023.
//

import SwiftUI

struct TopBar: View {
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {}, label: {
                    Image("Menu")
                })
                Spacer()
                Image("Twitter").resizable().scaledToFill()
                    .padding(.trailing)
                    .frame(width: 35, height: 35)
                Spacer()
            }.padding()
            LineCustome()
        }
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar()
    }
}
