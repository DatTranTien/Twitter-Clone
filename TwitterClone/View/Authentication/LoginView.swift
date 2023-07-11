//
//  LoginView.swift
//  TwitterClone
//
//  Created by Admin on 11/07/2023.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var passsword = ""
    @State var emailDone = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        if !emailDone {
            VStack{
                VStack{
                    ZStack{
                        HStack{
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Text("Cancel")
                                    .foregroundColor(.blue)
                            })
                            Spacer()
                        }
                        Image("Twitter")
                            .resizable()
                            .scaledToFill()
                            .padding(.trailing)
                            .frame(width: 20, height: 20)
                    }
                    Text("To get started first enter your phone, email, or username")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    CustomAuthTextField(placeholder: "Phone, Emai or Username", text: $email)
                }
                Spacer()
                VStack{
                    Spacer()
                    Button(action: {
                        if !email.isEmpty {
                            self.emailDone.toggle()
                        }
                    }, label: {
                        Capsule()
                            .frame(width: 360, height: 40,alignment: .center)
                            .foregroundColor(.blue)
                            .overlay(
                                Text("Next")
                                    .foregroundColor(.white)
                            ).padding(.bottom,24)
                    })
                }
                Text("Forgot Password?")
                    .foregroundColor(.blue)
            }
        }
        else{
            VStack{
                VStack{
                    ZStack{
                        HStack{
                            Button(action: {
                                presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Text("Cancel")
                                    .foregroundColor(.blue)
                            })
                            Spacer()
                        }
                        Image("Twitter")
                            .resizable()
                            .scaledToFill()
                            .padding(.trailing)
                            .frame(width: 20, height: 20)
                    }
                    Text("Enter your password")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .padding(.top)
                    SecureAuthTextField(placeholder: "Password", text: $passsword)
                }
                Spacer()
                VStack{
                    Spacer()
                    Button(action: {
                        self.emailDone.toggle()
                    }, label: {
                        Capsule()
                            .frame(width: 360, height: 40,alignment: .center)
                            .foregroundColor(.blue)
                            .overlay(
                                Text("Log In")
                                    .foregroundColor(.white)
                            ).padding(.bottom,24)
                    })
                }
                NavigationLink(destination: LoginView().navigationBarHidden(true)){
                    Text("Forgot Password?")
                }.foregroundColor(.blue)
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
