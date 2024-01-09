//
//  MovieDBApp.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 20/12/23.
//

import SwiftUI

@main
struct MovieDBApp: App {
    let router: HomeRouter = AppAssembler.shared.resolve()
    var body: some Scene {
        WindowGroup {
            ContentView(router: router)
        }
    }
}

//#Preview {
//    let router: HomeRouter = AppAssembler.shared.resolve()
//    ContentView(router: router)
//}
