//
//  SearchView.swift
//  TwitterClone
//
//  Created by Admin on 03/07/2023.
//

import SwiftUI

struct SearchView: View {
    @State var isEditing = false
    @State var text = ""
    var body: some View {
        VStack(spacing: 10, content: {
            SearchBar(text: text,isEditing: isEditing).padding(.horizontal)
            if isEditing {
                List(1..<11){i in
                    SearchCell(tag: String(i),tweet: "sfdg")
                }
            }else{
                List(1..<6){i in
                    SearchUserCell()
                }
            }
        })
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
