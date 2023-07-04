//
//  MessageCell.swift
//  TwitterClone
//
//  Created by Admin on 04/07/2023.
//

import SwiftUI

struct MessageCell: View {
    @State var width = UIScreen.main.bounds.width
    var body: some View {
        VStack(alignment: .leading, content: {
            Rectangle()
                .frame(width: width,height: 1, alignment: .center)
                .foregroundColor(.gray)
                .opacity(0.3)
            
            HStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
                    .padding(.leading)
                
                VStack(alignment: .leading, spacing: 0, content: {
                    HStack(content: {
                        Text("Lucifer ")
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                        
                        Text("@Fallen_Angle").foregroundColor(.gray)
                        Spacer()
                        Text("31/05/99")
                            .foregroundColor(.gray)
                            .padding(.trailing)
                        Spacer()
                    })
                })
            }.padding(.top,2)
        }).frame(width: width,height: 84)
    }
}

struct MessageCell_Previews: PreviewProvider {
    static var previews: some View {
        MessageCell()
    }
}
