//
//  ProfileView.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 27/2/22.
//

import SwiftUI
import GoogleSignIn

struct ProfileView: View {
    @EnvironmentObject private var authenticationvm: AuthenticationViewModel
    
    @State private var selectedAccounts: Posts = .own
    @State private var isPresented: Bool = false
    
    private let user = GIDSignIn.sharedInstance.currentUser
    var columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.clover.opacity(0.4)
                    .ignoresSafeArea()
                
                VStack(spacing: 10) {
                    NetworkImage(url: user?.profile?.imageURL(withDimension: 200))
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150, alignment: .center)
                        .cornerRadius(10)
                    
                    VStack {
                        Text(user?.profile?.name ?? "")
                            .fontSelection(type: .shadowsLight2, size: 50)
                        
                        Text("Member in Tokyo")
                            .fontSelection(type: .opensansBold, size: 20)
                        
                        HStack(spacing: 20) {
                            Text("Followers \(0)")
                            Text("Following \(10)")
                        }
                        .fontSelection(size: 15)
                    }
                    
                    Picker("Posts", selection: $selectedAccounts) {
                        Text("Your Posts")
                            .tag(Posts.own)
                        Text("Saved Posts")
                            .tag(Posts.saved)
                        Text("Posts from followed accounts")
                            .tag(Posts.followed)
                    }
                    .pickerStyle(.menu)
                    .frame(maxWidth: .infinity)
                    .padding(7)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 5) {
                            if selectedAccounts == .own {
                                ForEach(0..<12) { _ in
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .frame(width: 120, height: 120)
                                }
                            } else if selectedAccounts == .saved {
                                ForEach(0..<7) { _ in
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .frame(width: 120, height: 120)
                                }
                            } else if selectedAccounts == .followed {
                                ForEach(0..<26) { _ in
                                    RoundedRectangle(cornerRadius: 10.0)
                                        .frame(width: 120, height: 120)
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal, 5)
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gear")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .onTapGesture {
                            isPresented.toggle()
                        }
                }
            })
            .sheet(isPresented: $isPresented) {
                NavigationView {
                    Form {
                        Section {
                            
                        } header: { Text("Account") }
                        
                        Section {
                            
                        } header: { Text("Privacy") }
                        
                        Section {
                            
                        } header: { Text("Help") }
                        
                        Section {
                            
                        } header: { Text("About") }
                        
                        Button(action: {
                            authenticationvm.signOut()
                        }) {
                            Text("Sign Out")
                                .frame(maxWidth: .infinity)
                                .background(.white, in: RoundedRectangle(cornerRadius: 10))
                        }
                        .foregroundColor(.leaf)
                        .padding()
                        
                    }
                    .navigationTitle("Settings")
                }
            }
        }
    }
}

enum Posts: String, CaseIterable, Identifiable {
    case followed
    case saved
    case own
    
    var id: Self { self }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(AuthenticationViewModel())
    }
}

struct NetworkImage: View {
    let url: URL?
    
    var body: some View {
        if let url = url, let data = try? Data(contentsOf: url), let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            Image(systemName: "person.crop.circle.badge.plus")
                .resizable()
                .symbolRenderingMode(.multicolor)
                .frame(width: 150, height: 135)
        }
    }
}
