//
//  UserAssembler.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 09/01/24.
//

import Foundation

protocol UserAssembler {
    func resolve() -> UserView
}

extension UserAssembler where Self: Assembler {
    
    func resolve() -> UserView {
        UserView()
    }
    
}
