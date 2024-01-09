//
//  SnapCarousel.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 04/01/24.
//

import SwiftUI

struct SnapCarousel<Content: View, T: Identifiable>: View {
    
    let geometryProxy: GeometryProxy
    var content: (T) -> Content
    let list: [T]
    
    //Properties
    let itemWidth: CGFloat
    let spacing: CGFloat
    
    init(
        list: [T],
        itemWidth: CGFloat,
        geometryProxy: GeometryProxy,
        spacing: CGFloat,
        content: @escaping (T) -> Content
    ) {
        self.content = content
        self.list = list
        self.itemWidth = itemWidth
        self.spacing = spacing
        self.geometryProxy = geometryProxy
    }
    
    var body: some View {
        HStack(spacing: spacing) {
            ForEach(list, id: \.id) { item in
                content(item)
                    .frame(width: geometryProxy.size.width * itemWidth)
            }
        }
        .offset(x: spacing)
    }
}

//#Preview {
//    SnapCarousel()
//}
