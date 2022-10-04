//
//  Login.swift
//  MantasTest
//
//  Created by StuNNer on 10/3/22.
//

import SwiftUI

struct Login: View {
    @FocusState private var focusedField: FocusedField?
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordField = true
    @State private var selection: String? = nil
    
    var body: some View {
        VStack(spacing: 20){
            Text("Login")
                .font(.custom("Poppins-SemiBold", size: 30))
                .foregroundColor(Color("title_fg"))
            
            VSpacer(height: 50)
            
            GeneralTextField(label: "Email Address", text: $email, focusedField: $focusedField, textField: .emailAddress, isPasswordField: .constant(false), keyboardType: .emailAddress, textContentType: .emailAddress, icon: "envelope")
                .onSubmit {
                    focusedField = .password
                }
            
            GeneralTextField(label: "Password", text: $password, focusedField: $focusedField, textField: .password, isPasswordField: $isPasswordField, hasPasswordField: true, textContentType: .password, submitLabel: .done, icon: "lock")
                .onSubmit {
                    focusedField = nil
                }
            
            Button {
                print("Button clicked!")
            } label: {
                GeneralButtonBG(title: "Login")
            }
            
            VSpacer(height: 50)
        }
        .padding()
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Login()
        }
    }
}
