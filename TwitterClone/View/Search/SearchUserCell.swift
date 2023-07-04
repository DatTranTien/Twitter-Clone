//
//  SearchUserCell.swift
//  TwitterClone
//
//  Created by Admin on 04/07/2023.
//

import SwiftUI

struct SearchUserCell: View {
    var body: some View {
        HStack(content: {
            Image("logo").resizable().frame(width: 55,height: 55).clipShape(Circle())
            VStack(alignment: .leading,content: {
                Text("Lucifer").fontWeight(.heavy)
                Text("@Fallen_Angel")
            })
        })
    }
}

struct SearchUserCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchUserCell()
    }
}
