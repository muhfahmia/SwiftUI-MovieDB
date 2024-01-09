//
//  DetailAssembler.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 09/01/24.
//

import Foundation

protocol DetailAssembler {
    func resolve(movie: Movie) -> DetailView
    func resolve() -> DetailPresenter
}

extension DetailAssembler where Self: Assembler {
    
    func resolve(movie: Movie) -> DetailView {
        DetailView(movie: movie, vm: resolve())
    }
    
    func resolve() -> DetailPresenter {
        DetailPresenter(movieDetailUseCase: resolve())
    }
    
}
