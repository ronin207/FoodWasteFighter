//
//  Fonts.swift
//  FoodWasteFighter
//
//  Created by Takumi Otsuka on 25/2/22.
//

import SwiftUI

enum FontType: String {
    case opensans = "OpenSans-Regular"
    case opensansLight = "OpenSans-Light"
    case opensansBold = "OpenSans-Bold"
    case opensansSemiBold = "OpenSans-SemiBold"
    case shadowsLight2 = "ShadowsIntoLightTwo-Regular"
}

struct Fonts: ViewModifier {
    var type: FontType
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom(type.rawValue, size: size))
    }
}

extension View {
    func fontSelection(type: FontType = .opensans, size: CGFloat) -> some View {
        modifier(Fonts(type: type, size: size))
    }
}

struct Fonts_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            Text("Open Sans")
                .fontSelection(type: .opensans, size: 20)
            
            Text("Open Sans Light")
                .fontSelection(type: .opensansLight, size: 20)
            
            Text("Open Sans Bold")
                .fontSelection(type: .opensansBold, size: 20)
            
            Text("Open Sans SemiBold")
                .fontSelection(type: .opensansSemiBold, size: 20)
            
            Text("Shadow Into Light 2")
                .fontSelection(type: .shadowsLight2, size: 20)
        }
    }
}
