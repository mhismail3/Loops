//
//  RegisterView.swift
//  Tasks
//
//  Created by Moose on 10/14/23.
//

import SwiftUI

struct RegisterView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            
            // Title and Subtitle
            HStack {
                VStack(alignment: .leading, content: {
                    Text("Register")
                        .font(.custom("Lusitana-Bold", size: 54))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("Create a new account.")
                        .font(.custom("Lusitana-Bold", size: 20))
                        .fontWeight(.regular)
                })
                Spacer()
            }
            .padding()
            .padding([.top])
            
            Spacer()
            
            // Email and PW fields and Login button
            VStack {
                TextField("First Name", text: $email).padding()
                    .font(.custom("Poppins-Medium", size: 18))
                    .fontWeight(.regular)
                TextField("Last Name", text: $email).padding([.leading, .trailing, .bottom])
                    .font(.custom("Poppins-Medium", size: 18))
                    .fontWeight(.regular)
                TextField("Email Address", text: $email).padding([.leading, .trailing, .bottom])
                    .font(.custom("Poppins-Medium", size: 18))
                    .fontWeight(.regular)
                SecureField("Password", text: $password).padding([.leading, .trailing, .bottom])
                    .font(.custom("Poppins-Medium", size: 18))
                    .fontWeight(.regular)
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 6)
                            .foregroundColor(Color.cyan)
                            .shadow(color: .gray, radius: 1, x: 0, y: 1)
                        Text("Register").bold()
                            .foregroundColor(Color.white)
                            .font(.custom("Poppins-Medium", size: 18))
                            .fontWeight(.regular)
                    }
                })
                .frame(width: UIScreen.main.bounds.width - 20, height: 30.0)
            }
            .padding(.bottom, 200)
            
            Spacer()

            
            // Footer with logo and Create Account button
            VStack {
                Image("Loops Logo")
                    .resizable()
                    .frame(width: 60, height: 60)
                HStack {
                    Text("Have an account?")
                    NavigationLink("Log in", destination: LoginView())
                }.font(.custom("Lusitana-Bold", size: 18))
                    .fontWeight(.regular)
            }
        }
    }
}

#Preview {
    RegisterView()
}
