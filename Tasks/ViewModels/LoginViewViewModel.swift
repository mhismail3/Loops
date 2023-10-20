//
//  LoginViewViewModel.swift
//  Tasks
//
//  Created by Moose on 10/17/23.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    @Published var titleOpacity: Double = 0.0
    @Published var titleYOffset: CGFloat = 80
    
    @Published var fieldsOpacity: Double = 0.0
    @Published var fieldsYOffset: CGFloat = 60
    
    @Published var footerOpacity: Double = 0.0
    @Published var footerYOffset: CGFloat = 40
    
    @Published var errorMsgYOffset: CGFloat = -20.0
    @Published var errorMsgAnimDuration: Double = 0.3
    
    @Published var showingPopup = false
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        // Try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please enter your email and password"
            return false
        }
        
        guard email.contains("@"), email.contains(".") else {
            errorMessage = "Please enter a valid email"
            return false
        }
        
        return true
    }
}
