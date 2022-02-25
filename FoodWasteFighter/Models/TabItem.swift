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
    TabItem(text: "Home", image: "house", tab: .home, color: .mint),
    TabItem(text: "Inventory", image: "building.2", tab: .store, color: .mint),
    TabItem(text: "Blog", image: "rectangle.and.pencil.and.ellipsis", tab: .blog, color: .mint),
    TabItem(text: "Profile", image: "person", tab: .profile, color: .mint),
]

enum Tab: String {
    case home
    case store
    case blog
    case profile
}
