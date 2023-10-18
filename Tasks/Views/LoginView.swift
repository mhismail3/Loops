//
//  LoginView.swift
//  Tasks
//
//  Created by Moose on 10/14/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    @State var titleFontTypeBold = "Lusitana-Bold"
    @State var titleFontTypeRegular = "Lusitana-Regular"
    @State var bodyFontType = "Poppins-Medium"
    
    @State var titleFontSize: CGFloat = 54
    @State var subtitleFontSize: CGFloat = 20
    @State var bodyFontSize: CGFloat = 18
    
    @State var animationDuration: Double = 0.5
    @State var dampingFraction: Double = 0.5
    @State var blendDuration: Double = 0.0
    
    @State var titleOpacity: Double = 0.0
    @State var titleYOffset: CGFloat = 80
    
    @State var fieldsOpacity: Double = 0.0
    @State var fieldsYOffset: CGFloat = 60
    
    @State var footerOpacity: Double = 0.0
    @State var footerYOffset: CGFloat = 40
    
    @State var errorMsgYOffset: CGFloat = -20.0
    @State var errorMsgAnimDuration: Double = 0.3
    
    @State var finalOpacity: Double = 1.0
    @State var finalOffset: CGFloat = 0
    
    @State var squareImageDim: CGFloat = 60
    
    @State var showingPopup = false
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    // Title and Subtitle
                    HStack {
                        VStack(alignment: .leading, content: {
                            Text("Loops")
                                .font(.custom(titleFontTypeBold, size: titleFontSize))
                            Text("Keep track of everything.")
                                .font(.custom(titleFontTypeBold, size: subtitleFontSize))
                                .fontWeight(.regular)
                        })
                        Spacer()
                    }
                    .padding([.top, .horizontal]) // Apply padding
                    .opacity(titleOpacity)  // Apply initial opacity
                    .offset(y: titleYOffset)  // Apply initial horizontal offset
                    .onAppear {
                        withAnimation(.spring(response: animationDuration, dampingFraction: dampingFraction, blendDuration: blendDuration)) {
                            titleOpacity = finalOpacity
                            titleYOffset = finalOffset
                        }
                    }
                    
                    Spacer()
                    
                    // Email and PW fields and Login button
                    VStack {
                        Group {
                            TextField("Email Address", text: $viewModel.email)
                                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                .padding()
                            
                            SecureField("Password", text: $viewModel.password)
                                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                                .padding([.bottom, .horizontal])
                            
                            Button(action: { viewModel.login() }) {
                                Text("Login").bold()
                            }
                            .frame(width: UIScreen.main.bounds.width * 0.91, height: 36.0)
                            .buttonStyle(CustomButtonStyle())
                            .padding([.bottom, .horizontal])
                            
                            Text(viewModel.errorMessage)
                                .frame(height: 20)  // Reserve space
                                .foregroundColor(.red)
                                .opacity(viewModel.errorMessage.isEmpty ? 0 : 1)
                                .offset(y: viewModel.errorMessage.isEmpty ? errorMsgYOffset : 0)
                                .animation(.easeInOut(duration: errorMsgAnimDuration), value: viewModel.errorMessage)
                        }
                        .font(.custom(bodyFontType, size: bodyFontSize))
                    }
                    .opacity(fieldsOpacity)  // Apply opacity
                    .offset(y: fieldsYOffset)  // Apply horizontal offset
                    .onAppear {
                        withAnimation(.spring(response: animationDuration, dampingFraction: dampingFraction, blendDuration: blendDuration)) {
                            fieldsOpacity = finalOpacity
                            fieldsYOffset = finalOffset
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
                                showingPopup = true
                            }) {
                                Text("Create an account")
                            }.foregroundColor(.cyan)
                        }
                        .font(.custom(titleFontTypeBold, size: bodyFontSize))
                        .fontWeight(.regular)
                    }
                    .opacity(footerOpacity)  // Apply opacity
                    .offset(y: footerYOffset)  // Apply horizontal offset
                    .onAppear {
                        withAnimation(.spring(response: animationDuration, dampingFraction: dampingFraction, blendDuration: blendDuration)) {
                            footerOpacity = finalOpacity
                            footerYOffset = finalOffset
                        }
                    }
                }
                
                // Tap to dismiss
                if showingPopup {
                    Color.black.opacity(0.4)
                        .edgesIgnoringSafeArea(.all)
                        .onTapGesture {
                            showingPopup = false
                        }
                }
                
                if showingPopup {
                    RegisterPopupView()
                }
            }
        }
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .foregroundColor(configuration.isPressed ? Color.black : Color.cyan)
                .shadow(color: .gray, radius: 1, x: 0, y: 1)
            configuration.label
                .foregroundColor(Color.white)
                .font(.custom("Poppins-Medium", size: 18))
        }
    }
}

#Preview {
    LoginView()
}
