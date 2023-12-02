//
//  MainView.swift
//  MantasTest
//
//  Created by StuNNer on 10/3/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Login()
            }
            .preferredColorScheme(.light)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
