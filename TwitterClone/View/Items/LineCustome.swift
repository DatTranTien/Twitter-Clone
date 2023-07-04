//
//  LineCustome.swift
//  TwitterClone
//
//  Created by Admin on 04/07/2023.
//

import SwiftUI

struct LineCustome: View {
    @State var width = UIScreen.main.bounds.width
    var body: some View {
        HStack {
            Rectangle().frame(width: width, height: 1, alignment: .center).padding(.leading, 9).foregroundColor(.blue)
                Spacer()
            }
    }
}

struct LineCustome_Previews: PreviewProvider {
    static var previews: some View {
        LineCustome()
    }
}
