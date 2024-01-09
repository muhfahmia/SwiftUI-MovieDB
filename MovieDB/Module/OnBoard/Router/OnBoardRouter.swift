//
//  OnBoardRouter.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 04/01/24.
//

import Foundation

struct OnBoardRouter {
    
    private let assembler: Assembler
    
    init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    func onBoardView() -> OnBoardView {
        assembler.resolve()
    }
    
    func homeView() -> HomeView {
        assembler.resolve()
    }
    
}
