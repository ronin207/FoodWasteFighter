//
//  SettingsView.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 17/3/22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var authenticationvm: AuthenticationViewModel
    @State private var account = false
    @State private var privacy = false
    @State private var help = false
    
    var body: some View {
        VStack(spacing: 30) {
            DisclosureGroup(isExpanded: $account) {
                VStack(alignment: .leading, spacing: 10) {
                    NavigationLink(destination: {}) {
                        Text("Personal Information")
                    }
                    
                    NavigationLink(destination: {}) {
                        Text("Language")
                    }
                    
                    NavigationLink(destination: {}) {
                        Text("Professional Account")
                    }
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
            } label: {
                Text("Account")
                    .foregroundColor(.primary)
            }
            
            DisclosureGroup(isExpanded: $privacy) {
                VStack(alignment: .leading, spacing: 10) {
                    NavigationLink(destination: {}) {
                        Text("Hide Inappropriate Language")
                    }
                    
                    NavigationLink(destination: {}) {
                        Text("Code of Conduct")
                    }
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
            } label: {
                Text("Privacy")
                    .foregroundColor(.primary)
            }
            
            DisclosureGroup(isExpanded: $help) {
                VStack(alignment: .leading, spacing: 10) {
                    NavigationLink(destination: {}) {
                        Text("FAQs")
                    }
                    
                    NavigationLink(destination: {}) {
                        Text("Report Issue")
                    }
                }
                .padding(.vertical)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
            } label: {
                Text("Help")
                    .foregroundColor(.primary)
            }
            
            NavigationLink(destination: {}) {
                Text("About")
                    .foregroundColor(.primary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Spacer()
            
            Button(action: {
                authenticationvm.signOut()
            }) {
                Text("Sign Out")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.leaf, in: RoundedRectangle(cornerRadius: 10))
            }
            .foregroundColor(.white)
            
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
