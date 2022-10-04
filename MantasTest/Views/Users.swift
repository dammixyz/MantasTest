//
//  Users.swift
//  MantasTest
//
//  Created by StuNNer on 10/4/22.
//

import SwiftUI

struct Users: View {
    @FocusState private var focusedField: FocusedField?
    @State private var search = ""
    
    var body: some View {
        VStack{
            TitleText(text: "Search")
            
            GeneralTextField(label: "Search for name, email, address, phone", text: $search, focusedField: $focusedField, textField: .search, isPasswordField: .constant(false), submitLabel: .search)
                .onSubmit {
                    focusedField = nil
                }
            VSpacer(height: 40)
            
            UserInfoCard(image: "test_image", name: "Oluwadamilare Moronkola", email: "dammixyz@gmail.com", address: "Mayfair road, Ile-Ife, Osun State, Nigeria.", phone_no: "8399483985")
            Divider()
            UserInfoCard(image: "test_image", name: "Oluwadamilare Moronkola", email: "dammixyz@gmail.com", address: "Mayfair road, Ile-Ife, Osun State, Nigeria.", phone_no: "8399483985")
            Divider()
            UserInfoCard(image: "test_image", name: "Oluwadamilare Moronkola", email: "dammixyz@gmail.com", address: "Mayfair road, Ile-Ife, Osun State, Nigeria.", phone_no: "8399483985")
            
            Spacer()
        }
        .padding()
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct Users_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Users()
        }
    }
}
