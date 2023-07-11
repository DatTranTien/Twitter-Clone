//
//  RegisterView.swift
//  TwitterClone
//
//  Created by Admin on 11/07/2023.
//

import SwiftUI

struct RegisterView: View {
    @State var name = ""
    @State var email = ""
    @State var passsword = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Cancel")
                            .foregroundColor(.blue)
                    })
                    Spacer()
                }
                .padding(.horizontal)
                
                Image("Twitter")
                    .resizable()
                    .scaledToFill()
                    .padding(.trailing)
                    .frame(width: 20,height: 20)
                
                Text("Create your account")
                    .font(.title)
                    .bold()
                    .padding(.top,35)
                
                VStack(alignment: .leading, content: {
                    CustomAuthTextField(placeholder: "Name", text: $email)
                    CustomAuthTextField(placeholder: "Phone number or Email", text: $email)
                    SecureAuthTextField(placeholder: "Password", text: $passsword)
                })
                Spacer()
                
                VStack{
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.gray)
                    
                    HStack{
                        Spacer()
                        Button(action: {}, label: {
                            Capsule()
                                .frame(width: 60, height: 30,alignment: .center)
                                .foregroundColor(.blue)
                                .overlay(
                                    NavigationLink(destination: LoginView().navigationBarHidden(true)){
                                        Text("Next")
                                    }
                                    .foregroundColor(.white)
                                )
                        })
                    }.padding(.trailing,24)
                }
            }
        }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
