//
//  MovieListUseCase.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 31/12/23.
//

import Foundation
import Combine

protocol MovieListUseCase {
    func list(param: MovieListParameter) -> AnyPublisher<[Movie], Error>
}

struct MovieListInteractor: MovieListUseCase {
    
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func list(param: MovieListParameter) -> AnyPublisher<[Movie], Error> {
        repository.list(param: param)
    }
    
}
