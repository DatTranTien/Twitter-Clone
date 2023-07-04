//
//  MainView.swift
//  TwitterClone
//
//  Created by Admin on 04/07/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack{
            TopBar()
            Home()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
