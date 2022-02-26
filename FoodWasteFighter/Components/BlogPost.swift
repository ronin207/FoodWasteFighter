//
//  BlogPost.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 26/2/22.
//

import SwiftUI

struct BlogPost: View {
    @State private var star: Bool = false
    @State private var comment: Bool = false
    
    let name: String
    let description: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 10) {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 25, height: 25)
                Text(name)
                    .fontSelection(size: 25)
            }
            .padding(.horizontal)
            .padding(.vertical, 3)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 150)
            
            VStack(spacing: 10) {
                HStack(spacing: 20) {
                    Button {
                        star.toggle()
                    } label: {
                        Image(systemName: star ? "star.fill" : "star")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                    .tint(.yellow)
                    
                    Button {
                        comment.toggle()
                    } label: {
                        Image(systemName: "message.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                    .tint(.brown)
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(alignment: .top, spacing: 30) {
                    Text(name)
                        .fontSelection(type: .shadowsLight2, size: 18)
                    Text(description)
                        .fontSelection(size: 13)
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
        }
        .background(.ultraThinMaterial)
        .cornerRadius(5.0)
        .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 0)
    }
}

struct BlogPost_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green, .mint, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 10) {
                    BlogPost(name: "ABCD Store", description: "Here’s an idea for browned avocadoes- make guacamole!")
                    BlogPost(name: "Navya Ann", description: "Hey guys! we just had a graduation party and we have some extra food- link in my bio!")
                    BlogPost(name: "ABCD Store", description: "Here’s an idea for browned avocadoes- make guacamole!")
                }
            }
            .padding(5)
            .ignoresSafeArea(.container, edges: .bottom)
        }
    }
}
