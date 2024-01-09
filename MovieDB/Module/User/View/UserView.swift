//
//  UserView.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 08/01/24.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack {
                Text("User Profile")
                    .fontCustom(size: 24, fontWeight: .extraBold)
            }
        }
    }
}

#Preview {
    UserView()
}
