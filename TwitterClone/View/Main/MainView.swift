//
//  MainView.swift
//  TwitterClone
//
//  Created by Admin on 04/07/2023.
//

import SwiftUI

struct MainView: View {
    @State var width = UIScreen.main.bounds.width*1.2
    @State var x = -UIScreen.main.bounds.width*1.2
    var body: some View {
        
        NavigationView{
            VStack(content: {
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                    VStack{
                        TopBar(x: $x)
                        Home()
                    }
                    .onTapGesture {
                        withAnimation{
                            x = -width
                        }
                    }
                    SlideMenu()
                        .shadow(color: Color.black.opacity(x != 0 ? 0.1 : 0), radius: 5, x: 5, y:0)
                        .offset(x:x)
//                        .background(Color.white.opacity(x == 0 ? 1 : 0))
//                        .ignoresSafeArea(.all, edges: .vertical)
                        
                })
                .gesture(DragGesture().onChanged({(value) in
                    withAnimation{
                        if value.translation.width > 0 {
                            if x < 0{
                                x = -width + value.translation.width
                            }
                        }
                        else {
                            if x != -width{
                                x = value.translation.width
                            }
                        }
                    }
                    
                })
                    .onEnded({(value) in
                        withAnimation{
                            if -x < width/2 { x = 0}
                            else {
                                x = -width
                            }
                        }
                        
                        
                    })
                )
            })
        }.navigationBarHidden(true).navigationTitle("")
        
        
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
