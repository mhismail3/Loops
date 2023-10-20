//
//  LoginView.swift
//  Tasks
//
//  Created by Moose on 10/14/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var vm = LoginViewViewModel()
    
    let animationDuration: Double = 0.5
    let dampingFraction: Double = 0.5
    let blendDuration: Double = 0.0
    
    let finalOpacity: Double = 1.0
    let finalOffset: CGFloat = 0
    
    let squareImageDim: CGFloat = 60
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    // Title and Subtitle
                    HStack {
                        VStack(alignment: .leading, content: {
                            Text("Loops")
                                .font(.custom(Constants.FontType.titleFontTypeBold, size: Constants.FontSize.titleFontSize))
                            Text("Keep track of everything.")
                                .font(.custom(Constants.FontType.titleFontTypeBold, size: Constants.FontSize.subtitleFontSize))
                                .fontWeight(.regular)
                        })
                        Spacer()
                    }
                    .padding([.top, .horizontal]) // Apply padding
                    .opacity(vm.titleOpacity)
                    .offset(y: vm.titleYOffset)
                    .onAppear {
                        withAnimation(.spring(response: animationDuration, dampingFraction: dampingFraction, blendDuration: blendDuration)) {
                            vm.titleOpacity = finalOpacity
                            vm.titleYOffset = finalOffset
                        }
                    }
                    
                    Spacer()
                    
                    // Email and PW fields and Login button
                    VStack {
                        Group {
                            TextField("Email Address", text: $vm.email)
                                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                .padding()
                            
                            SecureField("Password", text: $vm.password)
                                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                .padding([.bottom, .horizontal])
                            
                            Button("Login") {
                                vm.login()
                            }
                            .buttonStyle(LoginButtonStyle())
                            
                            Text(vm.errorMessage)
                                .frame(height: 20)  // Reserve space
                                .foregroundColor(.red)
                                .opacity(vm.errorMessage.isEmpty ? 0 : 1)
                                .offset(y: vm.errorMessage.isEmpty ? vm.errorMsgYOffset : 0)
                                .animation(.easeInOut(duration: vm.errorMsgAnimDuration), value: vm.errorMessage)
                        }
                        .font(.custom(Constants.FontType.bodyFontType, size: Constants.FontSize.bodyFontSize))
                    }
                    .opacity(vm.fieldsOpacity)
                    .offset(y: vm.fieldsYOffset)
                    .onAppear {
                        withAnimation(.spring(response: animationDuration, dampingFraction: dampingFraction, blendDuration: blendDuration)) {
                            vm.fieldsOpacity = finalOpacity
                            vm.fieldsYOffset = finalOffset
                        }
                    }
                    
                    Spacer()

                    
                    // Footer with logo and Create Account button
                    VStack {
                        Image("Loops Logo")
                            .resizable()
                            .frame(width: squareImageDim, height: squareImageDim)
                        
                        HStack {
                            Text("First time?")
                            Button(action: {
                                vm.showingPopup = true
                            }) {
                                Text("Create an account")
                            }.foregroundColor(.cyan)
                        }
                        .font(.custom(Constants.FontType.titleFontTypeBold, size: Constants.FontSize.bodyFontSize))
                        .fontWeight(.regular)
                    }
                    .opacity(vm.footerOpacity)
                    .offset(y: vm.footerYOffset)
                    .onAppear {
                        withAnimation(.spring(response: animationDuration, dampingFraction: dampingFraction, blendDuration: blendDuration)) {
                            vm.footerOpacity = finalOpacity
                            vm.footerYOffset = finalOffset
                        }
                    }
                }
                
                // Tap outside popup to dismiss
                if vm.showingPopup {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            vm.showingPopup = false
                        }
                }
                
                if vm.showingPopup {
                    RegisterPopupView()
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
