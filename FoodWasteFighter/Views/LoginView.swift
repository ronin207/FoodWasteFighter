//
//  LoginView.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 10/3/22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var authenticationvm: AuthenticationViewModel
    
    var body: some View {
        ZStack {
            Color.clover
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Image("vegetables")
                    .resizable()
                    .scaledToFit()
                
                Text("Welcome!".uppercased())
                    .fontSelection(type: .shadowsLight2, size: 40)
                
                Text("Ready to be a part of a community that fights food waste?")
                    .fontSelection(type: .opensans, size: 15)
                    .padding(30)
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    authenticationvm.signIn()
                }) {
                    HStack(spacing: 16) {
                        Text("Sign in with Google")
                        Image("google")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .shadow(color: .leaf.opacity(0.3), radius: 2, x: -2, y: -2)
                    .shadow(color: .leaf.opacity(0.3), radius: 2, x: 2, y: 2)
                }
                
                Image("children")
                    .resizable()
                    .scaledToFit()
            }
            .foregroundColor(.leaf)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(AuthenticationViewModel())
    }
}
