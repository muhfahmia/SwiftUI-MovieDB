//
//  Movie.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 30/12/23.
//

import Foundation

struct Movies {
    var page: Int?
    var movies: [Movie]?
}

struct Movie: Identifiable {
    var id: UUID = UUID()
    var movieID: Int?
    var title: String?
    var posterPath: String?
    var backdropPath: String?
    var releaseDate: String?
}
