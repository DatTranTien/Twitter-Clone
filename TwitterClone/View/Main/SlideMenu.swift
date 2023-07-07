//
//  SlideMenu.swift
//  TwitterClone
//
//  Created by Admin on 05/07/2023.
//

import SwiftUI

struct SlideMenu: View {
    @State var show = false
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    var menuButtons = ["Profile", "List", "Topic","Bookmarks", "Moments"]
    var body: some View {
        VStack{
            HStack(spacing: 0, content: {
                VStack(content: {
                        HStack(alignment: .top, content: {
                            Spacer()
                            VStack(content: {
                                Image("logo")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                HStack(alignment: .bottom){
                                    Spacer()
                                    Text("Lucifer")
                                        .font(.title3)
                                        .fontWeight(.black)
                                    Spacer()
                                    Button(action: {
                                        withAnimation{
                                            self.show.toggle()
                                        }
                                    }, label: {
                                        Image(!show ?"IconDown": "IconUp")
                                    })
                                }.padding()
                                
                                Text("@Fallen_Angel").foregroundColor(.gray)
                                
                                HStack(spacing: 20, content: {
                                    FollowView(count: 8, title: "Following")
                                    FollowView(count: 16, title: "Followers")
                                }).padding()
                            })
                            
                            Spacer(minLength: 0)
                            
                           
                            
                        })
                    
                    VStack(alignment: .leading, content: {
                        ForEach(menuButtons,id: \.self) {item in
                            MenuButton(title: item)
                        }
                        
                        Divider()
                            .padding(.top)
                        
                        Button(action: {}, label: {
                            Image("Ads")
                            MenuButton(title: "Twitter Ads")
                        })
                        Divider()
                        Button(action: {}, label: {
                            MenuButton(title: "Settings and privacy")
                        }).padding(.top,20)
                        Spacer()
                        Divider().padding(.bottom)
                        
                        HStack{
                            Button(action: {}, label: {
                                Image("help")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 26, height: 26)
                                    .foregroundColor(Color("bg"))
                            })
                            Spacer()
                            Image("barcode")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 26, height: 26)
                                .foregroundColor(Color("bg"))
                        }
                    }).padding()
                    .opacity(show ? 1 : 0)
                        .frame(height: show ? nil : 0)
                    
                    
                    VStack(alignment: .leading, content: {
                        Button(action: {}, label: {
                            Text("Create a new account").foregroundColor(Color("bg"))
                        })
                        Button(action: {}, label: {
                            Text("Add an existing").foregroundColor(Color("bg"))
                        })
                        Spacer()
                    })
                    .opacity(!show ? 1 : 0)
                        .frame(height: !show ? nil : 0)
                    
                }).padding(.horizontal,20)
                    .padding(.top, edges!.top == 0 ? 15 :edges?.top)
                    .frame(width: UIScreen.main.bounds.width*0.8)
                    .background(Color.white)
                
                Spacer()
            })
            
        }
    }
}

struct SlideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SlideMenu()
    }
}
