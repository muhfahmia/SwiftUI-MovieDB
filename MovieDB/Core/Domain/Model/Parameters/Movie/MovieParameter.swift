//
//  MovieParameter.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 30/12/23.
//


import Foundation

struct MovieDetailParameter: Encodable {
    
    var movieID: String
    let apiKey: String
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
    }
    
    init(movieID: String, apiKey: String = Constants.apiKey) {
        self.movieID = movieID
        self.apiKey = apiKey
    }
}

struct MovieListParameter: Encodable {
    let type: TypeMovie
    let apiKey: String
    let page: Int
    let region: String
    
    enum TypeMovie: String {
        case trending = "trending/movie"
        case popular = "popular"
        case topRated = "top_rated"
        case upComing = "upcoming"
        case nowPlaying = "now_playing"
    }
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
        case page, region
    }
    
    init(type: TypeMovie, page: Int, region: String) {
        self.type = type
        self.apiKey = Constants.apiKey
        self.page = page
        self.region = region
    }
}

struct DiscoverParamater: Encodable {
  let apiKey: String
  let language: String
  let sortBy: SortType
  let page: Int

  enum SortType: String, Encodable {
    case popularity = "popularity.desc"
    case releaseDate = "release_date.desc"
    case voteAverage = "vote_average.desc"
  }

  init(sortBy: SortType, page: Int = 1) {
    self.apiKey = Constants.apiKey
    self.language = Constants.enUs
    self.sortBy = sortBy
    self.page = page
  }
}
