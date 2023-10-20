//
//  RegisterPopupView.swift
//  Tasks
//
//  Created by Moose on 10/18/23.
//

import SwiftUI

struct RegisterPopupView: View {
    @StateObject var vm = RegisterPopupViewViewModel()
    
    let animationDuration: Double = 0.4
    let dampingFraction: Double = 0.7
    let blendDuration: Double = 0.0
    
    let viewWidth: CGFloat = UIScreen.main.bounds.width * 0.91
    let viewHeight: CGFloat = UIScreen.main.bounds.height * 0.45
    
    var body: some View {
        VStack {
            
            /// Title, subtitle, and logo
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Register")
                            .font(.custom(Constants.FontType.titleFontTypeBold, size: Constants.FontSize.popupTitleFontSize))
                        Spacer()
                        Image("Loops Logo")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .offset(x: 8.0)
                    }
                        
                    Text("Create a new account.")
                        .font(.custom(Constants.FontType.titleFontTypeBold, size: Constants.FontSize.subtitleFontSize))
                        .fontWeight(.regular)
                        .offset(y: -10.0)
                }
                Spacer()
            }
            
            Spacer()

            /// Text fields for user input
            Group {
                TextField("Name", text: $vm.name)
                TextField("Email Address", text: $vm.email)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                SecureField("Password", text: $vm.password)
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            }
            .font(.custom(Constants.FontType.bodyFontType, size: Constants.FontSize.bodyFontSize))
            .padding(.bottom)
            
            Spacer()
            
            /// Register Button
            Button("Register") {
                vm.register()
            }
            .buttonStyle(LoginButtonStyle(containerWidth: viewWidth))
        }
        .padding(.all, 14)
        .frame(width: viewWidth, height: viewHeight)
        .background(Color.white)
        .cornerRadius(6)
        .shadow(radius: 5, x: 0, y: 3)
        .offset(y: vm.viewYOffset)
//        .scaleEffect(vm.viewScale)
        .opacity(vm.viewOpacity)
        .onAppear {
            withAnimation(.spring(response: animationDuration, dampingFraction: dampingFraction, blendDuration: blendDuration)) {
//                vm.viewScale = 1.0
                vm.viewYOffset = 0
                vm.viewOpacity = 1.0
            }
        }
    }
}

#Preview {
    RegisterPopupView()
}

