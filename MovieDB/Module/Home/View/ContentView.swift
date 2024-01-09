//
//  ContentView.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 08/01/24.
//

import SwiftUI

struct ContentView: View {
    
    let router: HomeRouter
    
    var body: some View {
        TabView {
            router.routeHome()
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            router.routeWatchlist()
            .tabItem {
                Label("Watchlist", systemImage: "film")
            }
            
            router.routeUser()
            .tabItem {
                Label("User", systemImage: "person")
            }
        }
        .onAppear {
            UITabBar.appearance().backgroundColor = UIColor(named: "SecondaryColor")
        }
    }
}
