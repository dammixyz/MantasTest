//
//  TextFieldBG.swift
//  MantasTest
//
//  Created by StuNNer on 10/3/22.
//

import SwiftUI

struct TextFieldBG: View {
    let errorText : String?
    var body: some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color("textfield_bg"))
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke((errorText != nil) ? Color("error") : Color.clear, lineWidth: 1)
            )
    }
}
