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
        dataSource.list(param: param).map{
            MovieMapper.moviesMapperToDomain(movies: $0.movies)
        }.eraseToAnyPublisher()
    }
    
    func detail(param: MovieDetailParameter) -> AnyPublisher<Movie, Error> {
        return dataSource.videos(param: param)
        .flatMap{ videos in
            return dataSource.credits(param: param)
                .flatMap { credits in
                    return dataSource.detail(param: param)
                        .map { movie in
                            MovieMapper.movieMapperToDomainWithVideoCredits(movie: movie, videos: videos.videos, casts: credits.casts)
                        }.eraseToAnyPublisher()
                }.eraseToAnyPublisher()
        }.eraseToAnyPublisher()
    }
    
    
}
