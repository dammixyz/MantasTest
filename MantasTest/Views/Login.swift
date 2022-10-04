//
//  Login.swift
//  MantasTest
//
//  Created by StuNNer on 10/3/22.
//

import SwiftUI

struct Login: View {
    let gotoUsersView = "UsersView"
    
    @StateObject var authViewModel: AuthViewModel = AuthViewModel()
    
    @FocusState private var focusedField: FocusedField?
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordField = true
    
    @State private var selection: String? = nil
    
    var body: some View {
        ZStack{
            NavigationLink(destination: Users(), tag: gotoUsersView, selection: $selection) { EmptyView() }
            
            VStack(spacing: 20){
                TitleText(text: "Login")
                
                VSpacer(height: 50)
                
                GeneralTextField(label: "Email Address", text: $email, focusedField: $focusedField, textField: .emailAddress, isPasswordField: .constant(false), keyboardType: .emailAddress, textContentType: .emailAddress, errorText:  authViewModel.emailError)
                    .onSubmit {
                        focusedField = .password
                    }
                
                GeneralTextField(label: "Password", text: $password, focusedField: $focusedField, textField: .password, isPasswordField: $isPasswordField, hasPasswordField: true, textContentType: .password, submitLabel: .done, errorText: authViewModel.passwordError)
                    .onSubmit {
                        focusedField = nil
                    }
                
                Button {
                    authViewModel.validateLoginDate(email: email, password: password)
                    if authViewModel.loginSuccessful {
                        selection = gotoUsersView
                    }
                } label: {
                    GeneralButtonBG(title: "Login")
                }
                
                VSpacer(height: 50)
            }
            .padding()
        }
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Login()
        }
    }
}
