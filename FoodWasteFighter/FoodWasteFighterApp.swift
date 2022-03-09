//
//  FoodWasteFighterApp.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 24/2/22.
//

import SwiftUI
import Firebase
import GoogleSignIn

@main
struct FoodWasteFighterApp: App {
    @StateObject private var authenticationvm = AuthenticationViewModel()
    
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.clear
        UITextField.appearance().backgroundColor = UIColor(.white.opacity(0.4))
        setupAuthentication()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .environmentObject(authenticationvm)
                    .navigationBarHidden(true)
            }
            .navigationViewStyle(.stack)
        }
    }
}

extension FoodWasteFighterApp {
    private func setupAuthentication() {
        FirebaseApp.configure()
    }
}
