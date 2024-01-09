//
//  RemoteDataSource.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 28/12/23.
//

import Foundation
import Combine

protocol MovieDataSource {
    func list(param: MovieListParameter) -> AnyPublisher<Movies, Error>
    func detail(param: MovieDetailParameter) -> AnyPublisher<Movie, Error>
}

struct DefaultMovieDataSource: MovieDataSource {
    func list(param: MovieListParameter) -> AnyPublisher<Movies, Error> {
        return NetworkService.shared.request(baseAPI: MovieAPI.list(param: param))
    }
    
    func detail(param: MovieDetailParameter) -> AnyPublisher<Movie, Error> {
        NetworkService.shared.request(baseAPI: MovieAPI.detail(param: param))
    }
}
