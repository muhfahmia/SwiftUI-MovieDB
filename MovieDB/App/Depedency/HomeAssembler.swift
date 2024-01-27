//
//  HomeAssembler.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 04/01/24.
//

import Foundation

protocol HomeAssembler {
    func resolve() -> HomeView
    func resolve() -> HomePresenter
    func resolve() -> HomeRouter
}

extension HomeAssembler where Self: Assembler {
    
    func resolve() -> HomeView {
        HomeView(vm: resolve(), router: resolve())
    }
    
    func resolve() -> HomePresenter {
        HomePresenter(movieListUseCase: resolve())
    }
    
    func resolve() -> HomeRouter {
        HomeRouter(assembler: self)
    }
    
}
