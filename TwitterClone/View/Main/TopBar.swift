//
//  TopBar.swift
//  TwitterClone
//
//  Created by Admin on 04/07/2023.
//

import SwiftUI

struct TopBar: View {
    @Binding var x : CGFloat
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                   
                    withAnimation{
                        x=0
//                    self.SlideMenu()
//                        self.show.toggle()
                    }
                }, label: {
                    Image("Menu")
                })
                Spacer()
                Image("Twitter").resizable().scaledToFill()
                    .padding(.trailing)
                    .frame(width: 35, height: 35)
                Spacer()
            }.padding()
            LineCustome()
        }
    }
}

//struct TopBar_Previews: PreviewProvider {
//    static var previews: some View {
//        TopBar(x:0.5)
//    }
//}
