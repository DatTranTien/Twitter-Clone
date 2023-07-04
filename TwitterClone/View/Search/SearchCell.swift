//
//  SearchCell.swift
//  TwitterClone
//
//  Created by Admin on 04/07/2023.
//

import SwiftUI

struct SearchCell: View {
    @State var tag = ""
    @State var tweet = ""
    var body: some View {
        VStack(alignment: .center, content: {
            Text("Hello").fontWeight(.heavy)
            HStack(content: {
                Text(tag + " ").fontWeight(.ultraLight)
                Text(tweet).fontWeight(.semibold)
            })
        })
    }
}

struct SearchCell_Previews: PreviewProvider {
    static var previews: some View {
        SearchCell()
    }
}
