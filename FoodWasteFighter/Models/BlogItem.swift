//
//  BlogItem.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 26/2/22.
//

import SwiftUI

struct BlogItem: Identifiable {
    var id = UUID()
    var image: String
    var name: String
    var description: String
    
    static var blogs = [
        BlogItem(image: "person.circle", name: "ABCD Store", description: "Here’s an idea for browned avocadoes- make guacamole!"),
        BlogItem(image: "person.circle.fill", name: "Navya Ann", description: "Hey guys! we just had a graduation party and we have some extra food- link in my bio!"),
        BlogItem(image: "person", name: "ABCD Store", description: "Here’s an idea for browned avocadoes- make guacamole!"),
    ]
}
