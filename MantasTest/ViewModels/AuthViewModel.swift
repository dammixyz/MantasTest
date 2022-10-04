//
//  AuthViewModel.swift
//  MantasTest
//
//  Created by StuNNer on 10/4/22.
//

import Foundation

class AuthViewModel: ObservableObject {
    @Published var emailError: String? = nil
    @Published var passwordError: String? = nil
    @Published var loginSuccessful: Bool = false
    
    func validateLoginDate(email: String, password: String) {
        if !Validator.email(email) {
            passwordError = nil
            emailError = "Invalid email format."
            return
        }
        else if password.count < 6 {
            emailError = nil
            passwordError = "Password must be at least 6 characters."
            return
        }
        else{
            passwordError = nil
            loginSuccessful = true
        }
    }
}

