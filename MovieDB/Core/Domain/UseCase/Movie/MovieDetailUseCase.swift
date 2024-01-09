//
//  MovieListUseCase.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 31/12/23.
//

import Foundation
import Combine

protocol MovieDetailUseCase {
    func detail(param: MovieDetailParameter) -> AnyPublisher<Movie, Error>
}

struct MovieDetailInteractor: MovieDetailUseCase {
    
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func detail(param: MovieDetailParameter) -> AnyPublisher<Movie, Error> {
        repository.detail(param: param)
    }
    
}
