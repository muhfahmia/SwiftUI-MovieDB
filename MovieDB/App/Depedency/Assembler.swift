//
//  Assembler.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 04/01/24.
//

import Foundation

protocol Assembler: CoreAssembler, OnBoardAssembler, HomeAssembler, DetailAssembler, WatchlistAssembler, UserAssembler {}

class AppAssembler: Assembler {
    static let shared = AppAssembler()
}
