//
//  TabBar.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 25/2/22.
//

import SwiftUI

struct TabBar: View {
    @State var selectedTab: Tab = .home
    @State var color: Color = .leaf
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home:
                    Text("Home")
                case .store:
                    Text("Store")
                case .blog:
                    Text("Blog")
                case .profile:
                    Text("Profile")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            tabbar
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}

extension TabBar {
    private var tabbar: some View {
        HStack {
            tabButton
        }
        .padding(.horizontal, 8)
        .padding(.top, 14)
        .frame(height: 88, alignment: .top)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 34, style: .continuous))
        .background(circularHighlight)
        .overlay(rectangularHighlight)
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
    
    private var tabButton: some View {
        ForEach(tabItems) { item in
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                    selectedTab = item.tab
                    color = item.color
                }
            } label: {
                // MARK: Tab Item Label
                VStack(spacing: 0) {
                    Image(systemName: item.image)
                        .symbolVariant(.fill)
                        .font(.body.bold())
                        .frame(width: 44, height: 29)
                    Text(item.text)
                        .fontSelection(type: .shadowsLight2, size: 15)
                        .foregroundColor(selectedTab == item.tab ? .black : .clear)
                }
                .frame(maxWidth: .infinity)
            }
            .foregroundStyle(selectedTab == item.tab ? .primary : .secondary)
            .blendMode(selectedTab == item.tab ? .overlay : .normal)
        }
    }
    
    private var circularHighlight: some View {
        // MARK: Circular Background Highlight
        HStack {
            if selectedTab == .profile { Spacer() }
            if selectedTab == .store { Spacer() }
            if selectedTab == .blog {
                Spacer()
                Spacer()
            }
            Circle()
                .fill(color)
                .frame(width: 88)
            if selectedTab == .home { Spacer() }
            if selectedTab == .store {
                Spacer()
                Spacer()
            }
            if selectedTab == .blog { Spacer() }
        }
        .padding(.horizontal, 8)
    }
    
    private var rectangularHighlight: some View {
        // MARK: Rectangular Label Highlight
        HStack {
            if selectedTab == .profile { Spacer() }
            if selectedTab == .store { Spacer() }
            if selectedTab == .blog {
                Spacer()
                Spacer()
            }
            Rectangle()
                .fill(color)
                .frame(width: 28, height: 5)
                .cornerRadius(3)
                .frame(width: 88)
                .frame(maxHeight: .infinity, alignment: .top)
            if selectedTab == .home { Spacer() }
            if selectedTab == .store {
                Spacer()
                Spacer()
            }
            if selectedTab == .blog { Spacer() }
        }
        .padding(.horizontal, 8)
    }
}
