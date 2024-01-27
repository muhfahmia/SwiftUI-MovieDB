//
//  HomeRouter.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 04/01/24.
//

import Foundation
import SwiftUI

struct HomeRouter {
    
    private let assembler: Assembler
    
    init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    func routeHome() -> HomeView {
        assembler.resolve()
    }
    
    func routeUser() -> UserView {
        assembler.resolve()
    }
    
    func routeWatchlist() -> WatchlistView {
        assembler.resolve()
    }
    
    func routeDetail(movie: Movie) -> some View  {
        let detailView: DetailView = DetailView(movie: movie, vm: assembler.resolve())
        return detailView
    }
    
}
