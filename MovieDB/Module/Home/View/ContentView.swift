//
//  ContentView.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 08/01/24.
//

import SwiftUI

struct ContentView: View {
    
    let router: HomeRouter
    
    init(router: HomeRouter) {
        self.router = router
    }
    
    var body: some View {
        TabView {
            router.routeHome()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            router.routeWatchlist()
                .tabItem {
                    Label("Watchlist", systemImage: "film.fill")
                }
            
            router.routeUser()
                .tabItem {
                    Label("User", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    let assembler: Assembler = AppAssembler.shared
    return ContentView(router: assembler.resolve())
}
