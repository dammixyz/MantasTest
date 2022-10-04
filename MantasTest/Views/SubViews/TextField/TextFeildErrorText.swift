//
//  TextFeildErrorText.swift
//  MantasTest
//
//  Created by StuNNer on 10/3/22.
//

import SwiftUI

struct TextFeildErrorText: View {
    let errorText : String?
    var body: some View {
        VStack(alignment: .leading) {
            if let errorText = errorText {
                Text(errorText)
                    .bold()
                    .foregroundColor(Color("error"))
                    .font(.subheadline)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
