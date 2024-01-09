//
//  MovieListRepository.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 31/12/23.
//

import Foundation
import Combine

protocol MovieRepository {
    func list(param: MovieListParameter) -> AnyPublisher<[Movie], Error>
    func detail(param: MovieDetailParameter) -> AnyPublisher<Movie, Error>
}

struct DefaultMovieRepository: MovieRepository {
    
    private let dataSource: MovieDataSource
    
    init(dataSource: MovieDataSource) {
        self.dataSource = dataSource
    }
    
    func list(param: MovieListParameter) -> AnyPublisher<[Movie], Error> {
        dataSource.list(param: param).compactMap{ $0.movies }.eraseToAnyPublisher()
    }
    
    func detail(param: MovieDetailParameter) -> AnyPublisher<Movie, Error> {
        dataSource.detail(param: param).compactMap { $0 }.eraseToAnyPublisher()
    }
    
}
