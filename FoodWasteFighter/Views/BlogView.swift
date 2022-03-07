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
            List {
                ForEach(BlogItem.blogs) { blog in
                    NavigationLink(destination: Text("Hello")) {
                        BlogPost(blog: blog)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    .swipeActions {
                        Button {
                            
                        } label: {
                            Image(systemName: "bookmark")
                        }
                        .tint(.orange)
                    }
                    .swipeActions(edge: .leading) {
                        Button {
                            
                        } label: {
                            Image(systemName: "heart")
                        }
                        .tint(.pink)
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "message")
                        }
                        .tint(.clover)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Blogs")
        }
        .searchable(text: $text, placement: .navigationBarDrawer(displayMode: .always))
    }
}

struct BlogView_Previews: PreviewProvider {
    static var previews: some View {
        BlogView()
    }
}
