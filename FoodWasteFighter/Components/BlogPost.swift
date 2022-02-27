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
                    .frame(width: 20, height: 20)
                Text(name)
                    .fontSelection(size: 20)
            }
            .padding(.horizontal)
            .padding(.vertical, 3)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                .padding(7)
            
            VStack(spacing: 10) {
                HStack(spacing: 16) {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 25, height: 25)
                    
                    Image(systemName: "message")
                        .resizable()
                        .frame(width: 25, height: 25)
                    
                    Spacer()
                    
                    Image(systemName: "bookmark")
                        .resizable()
                        .frame(width: 20, height: 25)
                }
                
                HStack(alignment: .top, spacing: 30) {
                    Text(name)
                        .fontSelection(type: .shadowsLight2, size: 18)
                    Text(description)
                        .fontSelection(size: 13)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding([.vertical, .horizontal])
        }
        .background(.ultraThinMaterial)
        .cornerRadius(5.0)
        .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 0)
    }
}

struct BlogPost_Previews: PreviewProvider {
    static var previews: some View {
        BlogPost(image: "person.circle", name: "ABCD Store", description: "Here’s an idea for browned avocadoes- make guacamole!")
    }
}
