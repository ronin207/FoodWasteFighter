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
            List(BlogItem.blogs) { blog in
                BlogPost(image: blog.image, name: blog.name, description: blog.description)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
            .background {
                LinearGradient(gradient: Gradient(colors: [.green, .mint, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            }
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(spacing: 20) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(7)
                            .background(.ultraThinMaterial, in: Circle())
                        
                        Image(systemName: "message.and.waveform.fill")
                            .foregroundColor(.white)
                            .padding(4)
                            .background(.ultraThinMaterial, in: Circle())
                    }
                }
            })
            .navigationTitle("Blog")
        }
        .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always))
        .fontSelection(type: .opensans, size: 17)
    }
}

struct BlogView_Previews: PreviewProvider {
    static var previews: some View {
        BlogView()
    }
}
