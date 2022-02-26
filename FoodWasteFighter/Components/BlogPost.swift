//
//  BlogPost.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 26/2/22.
//

import SwiftUI

struct BlogPost: View {
    let image: String
    let name: String
    let description: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 10) {
                Image(systemName: image)
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
                    BlogPost(image: "person.circle", name: "ABCD Store", description: "Here’s an idea for browned avocadoes- make guacamole!")
                    BlogPost(image: "person.circle.fill", name: "Navya Ann", description: "Hey guys! we just had a graduation party and we have some extra food- link in my bio!")
                    BlogPost(image: "person", name: "ABCD Store", description: "Here’s an idea for browned avocadoes- make guacamole!")
                }
            }
            .ignoresSafeArea(.container, edges: .bottom)
        }
    }
}
