//
//  ProfileView.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 27/2/22.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedAccounts: Posts = .own
    var columns = Array(repeating: GridItem(.flexible()), count: 3)
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.mint, .cyan]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack(spacing: 10) {
                    Image(systemName: "person.crop.circle.badge.plus")
                        .resizable()
                        .symbolRenderingMode(.multicolor)
                        .frame(width: 150, height: 135)
                    
                    VStack {
                        Text("Navya Ann")
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
                            ForEach(0..<12) { _ in
                                RoundedRectangle(cornerRadius: 10.0)
                                    .frame(width: 120, height: 120)
                            }
                        }
                    }
                }
                .padding(.horizontal, 5)
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
    }
}
