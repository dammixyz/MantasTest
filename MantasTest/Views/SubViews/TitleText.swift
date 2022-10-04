//
//  TitleText.swift
//  MantasTest
//
//  Created by StuNNer on 10/4/22.
//

import SwiftUI

struct TitleText: View {
    let text: String
    var size: CGFloat = 30
    var body: some View {
        Text(text)
            .font(.custom("Poppins-SemiBold", size: size))
            .foregroundColor(Color("title_fg"))
    }
}
