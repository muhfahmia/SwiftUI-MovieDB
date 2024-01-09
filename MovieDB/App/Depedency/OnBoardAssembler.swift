//
//  OnBoardAssebler.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 04/01/24.
//

import Foundation

protocol OnBoardAssembler {
    func resolve() -> OnBoardView
    func resolve() -> OnBoardRouter
}

extension OnBoardAssembler where Self: Assembler {
    
    func resolve() -> OnBoardView {
        OnBoardView(router: resolve())
    }
    
    func resolve() -> OnBoardRouter {
        OnBoardRouter(assembler: self)
    }
}
