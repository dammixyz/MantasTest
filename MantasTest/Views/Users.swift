//
//  Users.swift
//  MantasTest
//
//  Created by StuNNer on 10/4/22.
//

import SwiftUI

struct Users: View {
    @StateObject var userViewModel: UserViewModel = UserViewModel()
    @FocusState private var focusedField: FocusedField?
    @State private var search = ""
    
    var body: some View {
        VStack{
            Group{
                TitleText(text: "Search")
                
                GeneralTextField(label: "Search for name, email, address, phone", text: $search, focusedField: $focusedField, textField: .search, isPasswordField: .constant(false), submitLabel: .search)
                    .onSubmit {
                        focusedField = nil
                    }
            }
            .padding()
        
            
            List{
                LazyVStack(spacing: 9){
                    if let users = userViewModel.usersInfo{
                        ForEach(users.users.indices.filter({
                            "\(users.users[$0].results[0].name.first)".lowercased().contains(search.lowercased()) ||
                            "\(users.users[$0].results[0].name.last)".lowercased().contains(search.lowercased()) ||
                            "\(users.users[$0].results[0].email)".lowercased().contains(search.lowercased()) ||
                            "\(users.users[$0].results[0].location.street.number)".lowercased().contains(search.lowercased()) ||
                            "\(users.users[$0].results[0].location.street.name)".lowercased().contains(search.lowercased()) ||
                            "\(users.users[$0].results[0].location.city)".lowercased().contains(search.lowercased()) ||
                            "\(users.users[$0].results[0].location.state)".lowercased().contains(search.lowercased()) ||
                            "\(users.users[$0].results[0].location.country)".lowercased().contains(search.lowercased()) ||
                            "\(users.users[$0].results[0].phone)".lowercased().contains(search.lowercased()) ||
                            search.isEmpty
                        }), id: \.self){ index in
                            
                            UserInfoCard(image: "\(users.users[index].results[0].picture.large)", name: "\(users.users[index].results[0].name.title) \(users.users[index].results[0].name.first) \(users.users[index].results[0].name.last)", email: users.users[index].results[0].email, address: "\(users.users[index].results[0].location.street.number), \(users.users[index].results[0].location.street.name) Street, \(users.users[index].results[0].location.city), \(users.users[index].results[0].location.state), \(users.users[index].results[0].location.country)", phone_no: users.users[index].results[0].phone)
                            
                            if users.users.count != index+1 {
                                Divider()
                            }
                        }
                    }
                    else{
                        ProgressView()
                    }
                }
            }
            .listStyle(.plain)
            .refreshable {
                userViewModel.getUsers()
            }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .onAppear {
            userViewModel.getUsers()
        }
    }
}

struct Users_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Users()
        }
    }
}
