//
//  GeneralButtonBG.swift
//  MantasTest
//
//  Created by StuNNer on 10/3/22.
//

import SwiftUI

struct GeneralButtonBG: View {
    let title : String
    var bgcolor = "button_bg"
    var fgcolor = "app_white"
    var cornerRadius = 8
    var height = 50
    var body: some View {
        RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
            .fill(Color(bgcolor))
            .frame(height: CGFloat(height))
            .overlay(Text(title)
                        .foregroundColor(Color(fgcolor))
                        .bold()
                        .font(.custom("Poppins", size: 17))
            )
    }
}

struct GeneralButtonBG_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
