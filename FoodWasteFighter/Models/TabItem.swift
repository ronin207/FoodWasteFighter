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
    TabItem(text: "Map", image: "mappin", tab: .map, color: .leaf),
    TabItem(text: "Inventory", image: "building", tab: .store, color: .leaf),
    TabItem(text: "Blog", image: "rectangle.and.pencil.and.ellipsis", tab: .blog, color: .leaf),
    TabItem(text: "Profile", image: "person", tab: .profile, color: .leaf),
]

enum Tab: String {
    case map
    case store
    case blog
    case profile
}
