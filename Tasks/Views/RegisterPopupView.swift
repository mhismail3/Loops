//
//  RegisterPopupView.swift
//  Tasks
//
//  Created by Moose on 10/18/23.
//

import SwiftUI
//import _AuthenticationServices_SwiftUI
//SignInWithAppleButton(
//    onRequest: { request in
//        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
//    },
//    onCompletion: { result in
//        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Code@*/ /*@END_MENU_TOKEN@*/
//    }
//)

struct RegisterPopupView: View {
//    @Binding var showingPopup: Bool;
    
    @State var titleFontTypeBold = "Lusitana-Bold"
    @State var titleFontTypeRegular = "Lusitana-Regular"
    @State var bodyFontType = "Poppins-Medium"
    
    @State var titleFontSize: CGFloat = 38
    @State var subtitleFontSize: CGFloat = 20
    @State var bodyFontSize: CGFloat = 18
    
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var password = ""
    
    @State private var scale: CGFloat = 0.7  // Initial scale
    @State private var yOffset: CGFloat = 60.0
    @State private var opacity: CGFloat = 0.3
    
    var body: some View {
        VStack {
            
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Register")
                            .font(.custom(titleFontTypeBold, size: titleFontSize))
                        Spacer()
                        Image("Loops Logo")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .offset(x: 8.0)
                    }
                        
                    Text("Create a new account.")
                        .font(.custom("Lusitana-Bold", size: 20))
                        .fontWeight(.regular)
                        .offset(y: -10.0)
                }
                Spacer()
            }
            
            
            Spacer()

            Group {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email Address", text: $email)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                SecureField("Password", text: $password)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            }
            .font(.custom(bodyFontType, size: bodyFontSize))
            .fontWeight(.bold)
            .padding(.bottom)
            
            Spacer()
            
            Button(action: {
                // Handle Register
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 6)
                        .foregroundColor(Color.cyan)
                        .shadow(color: .gray, radius: 1, x: 0, y: 1)
                    Text("Register").bold()
                        .foregroundColor(Color.white)
                        .font(.custom(bodyFontType, size: bodyFontSize))
                        .fontWeight(.regular)
                }
            })
            .frame(height: 36.0)
        }
        .padding(.all, 14)
        .frame(width: UIScreen.main.bounds.width * 0.91, height: UIScreen.main.bounds.height * 0.45)
        .background(Color.white)
        .cornerRadius(6)
        .shadow(radius: 5, x: 0, y: 3)
        .offset(y: yOffset)
//        .scaleEffect(scale)  // Apply scale effect
        .opacity(opacity)
        .onAppear {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.5, blendDuration: 0)) {
//                scale = 1.0  // Final scale
                yOffset = 0
                opacity = 1.0
            }
        }
    }
}

#Preview {
    RegisterPopupView()
}

//struct PopupView_Previews: PreviewProvider {
//    @State static private var showingPopup = true  // Create a @State property
//
//    static var previews: some View {
//        RegisterPopupView(showingPopup: $showingPopup)  // Pass a binding to showingPopup
//    }
//}

