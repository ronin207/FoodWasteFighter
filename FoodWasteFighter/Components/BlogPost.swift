//
//  BlogPost.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 26/2/22.
//

import SwiftUI

struct BlogPost: View {
    let url = URL(string: "https://picsum.photos/300")
    
    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: url) { phase in
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
                    Text("ABCD Store")
                        .fontSelection(type: .shadowsLight2, size: 20)
                }
                
                Text("Hello all, welcome to ABCD Store! Here you can get the best deals!")
                    .fontSelection(size: 14)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
            }
        }
        .padding(7)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.ultraThinMaterial)
        .cornerRadius(10)
    }
}

struct BlogPost_Previews: PreviewProvider {
    static var previews: some View {
        BlogPost()
    }
}
