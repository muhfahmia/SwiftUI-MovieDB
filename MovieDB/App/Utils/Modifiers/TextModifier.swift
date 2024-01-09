//
//  Text.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 08/01/24.
//

import Foundation
import SwiftUI

enum FontWeight: String, CaseIterable {
    case regular = "OpenSans"
    case medium = "OpenSans-Medium"
    case semiBold = "OpenSans-SemiBold"
    case bold = "OpenSans-Bold"
    case extraBold = "OpenSans-ExtraBold"
}

struct TextDefault: ViewModifier {
    
    let size: CGFloat
    var fontWeight: FontWeight = .regular
    
    func body(content: Content) -> some View {
        content
            .font(Font.custom(fontWeight.rawValue, size: size))
            .foregroundStyle(.white)
    }
}

extension View {
    func fontCustom(size: CGFloat, fontWeight: FontWeight = .regular) -> some View {
        modifier(TextDefault(size: size, fontWeight: fontWeight))
    }
}
