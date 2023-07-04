//
//  NotificationsView.swift
//  TwitterClone
//
//  Created by Admin on 03/07/2023.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        VStack{
            ScrollView {
                ForEach(0..<9) {
                    _ in
                    NotificationsCell().padding(.top,15)
                }
            }
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
