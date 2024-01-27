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
    
    @Published var movieParamTrending: MovieListParameter = .init(type: .trending, page: 1, region: "")
    @Published var movieParamNowPlaying: MovieListParameter = .init(type: .nowPlaying, page: 1, region: "")
    @Published var movieParamTopRated: MovieListParameter = .init(type: .topRated, page: 1, region: "")
    @Published var movieParamUpComing: MovieListParameter = .init(type: .upComing, page: 1, region: "")
    @Published var movieParamPopular: MovieListParameter = .init(type: .popular, page: 1, region: "")
    @Published var movies: [Movie] = []
    @Published var movieNowPlaying: ViewState<[Movie]> = .initiate
    @Published var movieTopRated: ViewState<[Movie]> = .initiate
    @Published var moviePopular: ViewState<[Movie]> = .initiate
    @Published var movieUpComing: ViewState<[Movie]> = .initiate
    private let movieListUseCase: MovieListUseCase
    
    init(movieListUseCase: MovieListUseCase) {
        self.movieListUseCase = movieListUseCase
    }
    
    func getMovieList() {
        movieListUseCase.list(param: movieParamTrending)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:break
                case .failure(_):break
                }
            }, receiveValue: { [weak self] value in
                self?.movies = value.filter { $0.ranking < 11}
            }).store(in: &cancellables)
    }
    
    func getMovieListNowPlaying() {
        movieNowPlaying = .loading
        movieListUseCase.list(param: movieParamNowPlaying)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:break
                case .failure(_):break
                }
            }, receiveValue: { [weak self] value in
                self?.movieNowPlaying = .success(data: value)
            }).store(in: &cancellables)
    }
    
}
