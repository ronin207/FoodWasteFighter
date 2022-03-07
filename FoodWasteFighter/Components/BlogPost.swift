//
//  BlogPost.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 26/2/22.
//

import SwiftUI

struct BlogPost: View {
    let blog: BlogItem
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: blog.url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .cornerRadius(10)
                case .failure:
                    Image(systemName: "exclamationmark")
                        .font(.headline)
                default:
                    Image(systemName: "questionmark")
                        .font(.headline)
                }
            }
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(blog.name)
                        .fontSelection(type: .shadowsLight2, size: 20)
                }
                
                Text(blog.description)
                    .fontSelection(size: 14)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
            }
        }
        .padding(7)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
    }
}

struct BlogPost_Previews: PreviewProvider {
    static var previews: some View {
        BlogPost(blog: BlogItem(url: URL(string: "https://picsum.photos/300")!, name: "ABCD Store", description: "Hello all, welcome to ABCD Store! Here you can get the best deals!"))
    }
}
