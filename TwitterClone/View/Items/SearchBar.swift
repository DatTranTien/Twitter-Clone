//
//  SearchBar.swift
//  TwitterClone
//
//  Created by Admin on 04/07/2023.
//

import SwiftUI

struct SearchBar: View {
    @State var text = ""
    @State var isEditing = true
    var body: some View {
        HStack(spacing: 10,content: {
            TextField("Search Item", text: $text).padding(8).padding(.leading,36).background(Color(.systemGray6)).cornerRadius(20)
                .overlay(
                    HStack(alignment: .center, spacing: 20,content: {
                        Image("IconSearch")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity
                                   , alignment: .leading)
                            .padding(.leading,8)
                    })
                )
            Button(action: {
                isEditing=false
                text=""
                UIApplication.shared.endEditing()
            }, label: {
                Text("Cancel")
                    .foregroundColor(.black)
                    .padding(.trailing,8)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
            })
                
        })
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar()
    }
}
