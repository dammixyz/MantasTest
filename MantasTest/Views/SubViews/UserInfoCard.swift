//
//  UserInfoCard.swift
//  MantasTest
//
//  Created by StuNNer on 10/4/22.
//

import SwiftUI

struct UserInfoCard: View {
    let image, name, email, address, phone_no: String
    var body: some View {
        HStack(alignment: .top){
            AsyncImage(url: URL(string: image)){pic in
                pic
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Image("user_placeholder")
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
            .clipShape(Circle())
            .frame(width: 50, height: 50)
            
            VStack(alignment: .leading){
                TitleText(text: name, size: CGFloat(18))
                Text("\(Text("Email:").bold()) \(email)")
                Text("\(Text("Address:").bold()) \(address)")
                Text("\(Text("Phone No:").bold()) \(phone_no)")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
