//
//  BlogPost.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 26/2/22.
//

import SwiftUI

struct BlogPost: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 10) {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                Text("ABCD Store")
                    .fontSelection(size: 25)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.clover, in: Rectangle())
            
            Rectangle()
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .foregroundColor(.brown)
            
            VStack(spacing: 10) {
                HStack(spacing: 20) {
                    Button {
                        
                    } label: {
                        Image(systemName: "star")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "message")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(alignment: .top, spacing: 30) {
                    Text("ABCD Store")
                        .fontSelection(type: .shadowsLight2, size: 18)
                    Text("Here’s an idea for browned avocadoes- make guacamole!")
                        .fontSelection(size: 13)
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            .background(Color(red: 255/255, green: 255/255, blue: 240/255), in: Rectangle())
        }
        .cornerRadius(5.0)
    }
}

struct BlogPost_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 10) {
                    BlogPost()
                    BlogPost()
                    BlogPost()
                }
            }
        }
    }
}
