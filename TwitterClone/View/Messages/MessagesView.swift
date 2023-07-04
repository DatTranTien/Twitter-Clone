//
//  MessagesView.swift
//  TwitterClone
//
//  Created by Admin on 03/07/2023.
//

import SwiftUI

struct MessagesView: View {
    var body: some View {
        VStack(spacing: 10, content: {
                List(1..<11){i in
                    MessageCell()
                }
        })
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
