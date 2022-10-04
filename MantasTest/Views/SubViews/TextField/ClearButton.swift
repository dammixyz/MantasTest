//
//  ClearButton.swift
//  MantasTest
//
//  Created by StuNNer on 10/3/22.
//

import SwiftUI

struct ClearButton: View {
    @Binding var text: String
    var body: some View {
        VStack{
            Image(systemName: "multiply.circle.fill")
                .renderingMode(.template)
                .resizable()
                .foregroundColor(Color("grey"))
        }
        .aspectRatio(contentMode: .fit)
        .frame(width: 18, height: 18)
        .padding(3)
        .onTapGesture {
            text = ""
        }
    }
}
