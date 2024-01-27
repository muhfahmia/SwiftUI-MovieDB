//
//  TabBarItem.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 11/01/24.
//

import SwiftUI

struct TabBarItemCustom: View {
    
    let image: String
    @Binding var selectedTab: String
    
    var body: some View {
        VStack {
            Button(action: {
                selectedTab = image
            }, label: {
                Image(systemName: image)
                    .resizable()
                    .foregroundColor((selectedTab == image ? Color.white : Color.white.opacity(0.5)))
                    .frame(width: 25, height: 25)
            })
        }
    }
}

#Preview {
    @State var select: String = "house.fill"
    return TabBarItemCustom(image: "house.fill", selectedTab: $select)
}
