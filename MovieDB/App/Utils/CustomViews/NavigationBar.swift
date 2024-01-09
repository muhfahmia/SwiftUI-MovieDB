//
//  NavigationBar.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 09/01/24.
//

import SwiftUI

struct NavigationBar<Content: View>: View {
    
    var content: () -> Content?
    
    init(content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        HStack {
         Text("testsssssssss")
                .fontCustom(size: 25, fontWeight: .extraBold)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: 90)
        .padding(.horizontal, 25)
        .background(Color.background)
    }
}

#Preview {
    NavigationBar {
        Text("test")
    }
}
