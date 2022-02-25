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
    TabItem(text: "Home", image: "", tab: .home, color: .mint),
    TabItem(text: "Inventory", image: "", tab: .store, color: .mint),
    TabItem(text: "Blog", image: "", tab: .blog, color: .mint),
    TabItem(text: "Profile", image: "", tab: .profile, color: .mint),
]

enum Tab: String {
    case home
    case store
    case blog
    case profile
}
