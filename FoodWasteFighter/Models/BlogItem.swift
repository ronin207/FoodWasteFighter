//
//  BlogItem.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 26/2/22.
//

import SwiftUI

struct BlogItem: Identifiable {
    var id = UUID()
    var url: URL
    var name: String
    var description: String
    
    static var blogs = [
        BlogItem(url: URL(string: "https://picsum.photos/300")!, name: "ABCD Store", description: "Here’s an idea for browned avocadoes- make guacamole!"),
        BlogItem(url: URL(string: "https://picsum.photos/300")!, name: "Navya Ann", description: "Hey guys! we just had a graduation party and we have some extra food- link in my bio!"),
        BlogItem(url: URL(string: "https://picsum.photos/300")!, name: "ABCD Store", description: "Here’s an idea for browned avocadoes- make guacamole!"),
    ]
}
