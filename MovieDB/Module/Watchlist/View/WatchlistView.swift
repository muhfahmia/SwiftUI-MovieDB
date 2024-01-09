//
//  WatchlistView.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 08/01/24.
//

import SwiftUI

struct WatchlistView: View {
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            VStack {
                Text("Watchlist View")
                    .fontCustom(size: 18, fontWeight: .extraBold)
            }
        }
    }
}
