//
//  TabItem.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 25/2/22.
//

import SwiftUI

struct TabItem: Identifiable {
    var id = UUID()
    var text: String
    var image: String
    var tab: Tab
    var color: Color
}

var tabItems = [
    TabItem(text: "Map", image: "maps", tab: .map, color: .leaf),
    TabItem(text: "Inventory", image: "inventory", tab: .store, color: .leaf),
    TabItem(text: "Blog", image: "blogs", tab: .blog, color: .leaf),
    TabItem(text: "Profile", image: "profile", tab: .profile, color: .leaf),
]

enum Tab: String {
    case map
    case store
    case blog
    case profile
}
