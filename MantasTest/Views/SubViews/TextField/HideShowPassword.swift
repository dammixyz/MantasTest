//
//  HideShowPassword.swift
//  MantasTest
//
//  Created by StuNNer on 10/3/22.
//

import SwiftUI

struct HideShowPassword: View {
    @Binding var isPasswordField : Bool
    let hasPasswordField : Bool
    let text: String
    var body: some View {
        !hasPasswordField || text == "" ? nil :
        Image(systemName: isPasswordField ? "eye.slash.fill" : "eye")
            .renderingMode(.template)
            .resizable()
            .foregroundColor(Color("grey"))
            .aspectRatio(contentMode: .fit)
            .frame(width: 22, height: 22)
            .padding(3)
            .onTapGesture {
                isPasswordField.toggle()
            }
    }
}
