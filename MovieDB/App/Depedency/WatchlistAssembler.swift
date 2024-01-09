//
//  WatchlistAssembler.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 09/01/24.
//

import Foundation

protocol WatchlistAssembler {
    func resolve() -> WatchlistView
}

extension WatchlistAssembler where Self: Assembler {
    
    func resolve() -> WatchlistView {
        WatchlistView()
    }
    
}
