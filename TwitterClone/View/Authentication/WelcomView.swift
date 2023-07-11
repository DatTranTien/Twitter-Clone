//
//  WelcomView.swift
//  TwitterClone
//
//  Created by Admin on 11/07/2023.
//

import SwiftUI

struct WelcomView: View {
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Spacer()
                    Image("Twitter").resizable()
                        .scaledToFill()
                        .padding(.trailing)
                        .frame(width: 20, height: 20)
                    Spacer()
                }
                Spacer(minLength: 0)
                Text("See what's happening in the world right now.")
                    .font(.system(size: 30,weight: .heavy, design: .default))
                    .frame(width:  getRect().width*0.9,alignment: .center);            Spacer(minLength: 0)
                VStack(alignment: .center,spacing: 10, content: {
                    Button(action: {
                        print("Sign in google")
                    }, label: {
                        HStack(spacing: -4, content: {
                            Image("google")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                            
                            Text("Continue with Google")
                                .fontWeight(.bold)
                                .font(.title3)
                                .foregroundColor(.black)
                                .padding()
                        })
                        .overlay(
                            RoundedRectangle(cornerRadius: 36)
                                .stroke(Color.black,lineWidth: 1)
                                .opacity(0.3)
                                .frame(width: 320, height: 60, alignment: .center)
                        )
                    })
                })
                VStack(alignment: .center,spacing: 10, content: {
                    Button(action: {
                        print("Sign in Facebook")
                    }, label: {
                        HStack(spacing: -4, content: {
                            Image("facebook")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                            
                            Text("Continue with Facebook")
                                .fontWeight(.bold)
                                .font(.title3)
                                .foregroundColor(.black)
                                .padding()
                        })
                        .overlay(
                            RoundedRectangle(cornerRadius: 36)
                                .stroke(Color.black,lineWidth: 1)
                                .opacity(0.3)
                                .frame(width: 320, height: 60, alignment: .center)
                        )
                    })
                    
                    HStack{
                        Rectangle().foregroundColor(.gray)
                            .opacity(0.3)
                            .frame(width: getRect().width*0.35, height: 1)
                        Text("Or")
                            .foregroundColor(.gray)
                        
                        Rectangle()
                            .foregroundColor(.gray)
                            .opacity(0.3)
                            .frame(width: getRect().width*0.35, height: 1)
                    }
                    NavigationLink(destination: RegisterView().navigationBarHidden(true)){
                        RoundedRectangle(cornerRadius: 36)
                            .foregroundColor(Color(red: 29/255, green: 161/255, blue: 242/255))
                            .frame(width: 320, height: 60,alignment: .center)
                            .overlay(
                                Text("Create account")
                                    .fontWeight(.bold)
                                    .font(.title3)
                                    .foregroundColor(.white)
                                    .padding()
                            )
                    }
                    
                    VStack(alignment: .leading, content: {
                        VStack(content: {
                            Text("By signing up, you agree to our")+Text(" Term")
                                .foregroundColor(Color(red:29/255,green: 161/255,blue: 242/255))+Text(",") + Text(" Privacy Pollicy")
                                .foregroundColor(Color(red:29/255,green: 161/255,blue: 242/255))
                        }).padding(.bottom)
                        HStack(spacing: 2){
                            Text("Have an account already?")
                            NavigationLink(destination: LoginView().navigationBarHidden(true)){
                                Text(" Log in")
                            }
                            .foregroundColor(Color(red:29/255,green: 161/255,blue: 242/255))
                        }
                    })
                })
            }
        }
    }
}

struct WelcomView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomView()
    }
}
