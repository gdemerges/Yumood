//
//  ContentView.swift
//  Yumood
//
//  Created by apprenant75 on 20/09/2022.
//
// Page created by everybody

import SwiftUI

struct ContentView: View {
    var body: some View {
        LoginView()
            .accentColor(Color("GeneralColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
