//
//  BlogView.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 26/2/22.
//

import SwiftUI

struct BlogView: View {
    @State private var text: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search Posts", text: $text)
                    .textFieldStyle(.roundedBorder)
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 10) {
                        ForEach(BlogItem.blogs) { blog in
                            BlogPost(image: blog.image, name: blog.name, description: blog.description)
                        }
                    }
                }
            }
            .padding(10)
            .background {
                LinearGradient(gradient: Gradient(colors: [.green, .mint, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            }
            .navigationBarHidden(true)
        }
    }
}

struct BlogView_Previews: PreviewProvider {
    static var previews: some View {
        BlogView()
    }
}
