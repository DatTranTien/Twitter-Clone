//
//  NotificationsCell.swift
//  TwitterClone
//
//  Created by Admin on 04/07/2023.
//

import SwiftUI

struct NotificationsCell: View {
    var body: some View {
        HStack(alignment: .top,content: {
            Image("Follower")
            Image("logo").resizable().frame(width: 55,height: 55).clipShape(Circle())
            VStack(alignment: .leading,content: {
                Text("Lucifer").fontWeight(.heavy)
                Text("Followed you")
            })
            Spacer()
        }).padding(.leading,30)
        

    }
}

struct NotificationsCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsCell()
    }
}
