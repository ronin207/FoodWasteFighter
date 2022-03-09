//
//  ContentView.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 24/2/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var authenticationvm: AuthenticationViewModel
    
    var body: some View {
        switch authenticationvm.state {
        case .signin:
            TabBar()
        case .signout:
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AuthenticationViewModel())
    }
}
