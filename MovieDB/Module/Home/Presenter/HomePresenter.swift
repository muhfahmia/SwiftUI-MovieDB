//
//  HomePresenter.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 01/01/24.
//

import Foundation
import Combine

class HomePresenter: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var movieParam: MovieListParameter = .init(type: .trending, page: 1, region: "")
    @Published var movies: [Movie] = []
    private let movieListUseCase: MovieListUseCase
    
    init(movieListUseCase: MovieListUseCase) {
        self.movieListUseCase = movieListUseCase
    }
    
    func getMovieList() {
        movieListUseCase.list(param: movieParam)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:
                    print("finished")
                case .failure(let error):
                    print("error: \(error)")
                }
            }, receiveValue: { [weak self] value in
                self?.movies = value
            }).store(in: &cancellables)
    }
    
}
