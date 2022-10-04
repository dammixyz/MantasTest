//
//  GeneralTextField.swift
//  MantasTest
//
//  Created by StuNNer on 10/3/22.
//

import SwiftUI

struct GeneralTextField: View {
    var label: String
    @Binding var text: String
    var focusedField: FocusState<FocusedField?>.Binding
    var textField: FocusedField
    @Binding var isPasswordField : Bool // To display wrapped (secured) text
    var hasPasswordField : Bool = false  // To show eye icons of password
    var keyboardType: UIKeyboardType = .default
    var disableAutocorrection: Bool = true
    var textInputAutocapitalization: TextInputAutocapitalization? = .never
    var textContentType: UITextContentType? = .name
    var submitLabel: SubmitLabel = .next
    var errorText : String? = nil
    
    var body: some View {
        VStack(spacing: 0){
            HStack(spacing: 10){
                Group{
                    if isPasswordField{
                        SecureField(label, text: $text)
                    }
                    else{
                        TextField(label, text: $text)
                    }
                }
                .focused(focusedField, equals: textField)
                .disableAutocorrection(disableAutocorrection)
                .keyboardType(keyboardType)
                .textInputAutocapitalization(textInputAutocapitalization)
                .textContentType(textContentType)
                .submitLabel(submitLabel)
                .padding(.vertical, 15)
                .padding(.horizontal, 2)
                .font(.custom("Poppins", size: 17))
                .foregroundColor(errorText != nil ? Color("error") : Color("app_black"))
                HideShowPassword(isPasswordField: $isPasswordField, hasPasswordField: hasPasswordField, text: text)
                text == "" ? nil : ClearButton(text: $text)
                
            }
            .padding(.horizontal)
            .background(
                TextFieldBG(errorText: errorText)
            )
            TextFeildErrorText(errorText: errorText)
        }
    }
}

struct GeneralTextField_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Login()
        }
    }
}
