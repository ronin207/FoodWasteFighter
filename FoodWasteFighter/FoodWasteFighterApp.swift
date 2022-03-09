//
//  FoodWasteFighterApp.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 24/2/22.
//

import SwiftUI

@main
struct FoodWasteFighterApp: App {
    init() {
        UINavigationBar.appearance().backgroundColor = UIColor.clear
        UITextField.appearance().backgroundColor = UIColor(.white.opacity(0.4))
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
                    .navigationBarHidden(true)
            }
            .navigationViewStyle(.stack)
        }
    }
}
