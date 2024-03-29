//
//  HomePresenter.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 01/01/24.
//

import Foundation
import Combine

class DetailPresenter: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var movie: Movie = .init()
    @Published var movieParam: MovieDetailParameter = MovieDetailParameter(movieID: "181808")
    private let movieDetailUseCase: MovieDetailUseCase
    
    init(movieDetailUseCase: MovieDetailUseCase) {
        self.movieDetailUseCase = movieDetailUseCase
    }
    
    func getMovieDetail() {
        movieDetailUseCase.detail(param: movieParam)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished: break
                case .failure(let error):
                    print("error: \(error)")
                }
            }, receiveValue: { [weak self] value in
                self?.movie = value
            }).store(in: &cancellables)
    }
    
}
