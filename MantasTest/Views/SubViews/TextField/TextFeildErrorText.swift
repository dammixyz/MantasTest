//
//  TextFeildErrorText.swift
//  MantasTest
//
//  Created by StuNNer on 10/3/22.
//

import SwiftUI

struct TextFeildErrorText: View {
    let errorText : String
    var hasError : Bool
    var body: some View {
        VStack(alignment: .leading) {
            !hasError ? nil : Text(errorText)
                .bold()
                .foregroundColor(Color("error"))
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
