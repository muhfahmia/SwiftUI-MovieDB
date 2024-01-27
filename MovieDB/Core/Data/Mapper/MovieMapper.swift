//
//  MovieMapper.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 10/01/24.
//

import Foundation

struct MovieMapper {
    
    static func moviesMapperToDomain(movies: [Movie]) -> [Movie] {
        return movies.enumerated().map { (index, movie) in
            let rank = index + 1
            return Movie(ranking: rank, movieID: movie.movieID, title: movie.title, posterPath: movie.posterPath, backdropPath: movie.backdropPath, releaseDate: movie.releaseDate, description: movie.description, adult: movie.adult, duration: movie.duration, country: movie.country, rating: movie.rating)
        }
    }
    
    static func movieMapperToDomain(movie: Movie) -> Movie {
        return Movie(
            movieID: movie.movieID,
            title: movie.title,
            posterPath: movie.posterPath,
            backdropPath: movie.backdropPath,
            releaseDate: movie.releaseDate,
            description: movie.description,
            adult: movie.adult,
            duration: movie.duration,
            country: movie._productionHouse.first?.country ?? "-",
            productionHouse: movie._productionHouse.first?.name ?? "-",
            trailer: movie.trailer
        )
    }
    
    static func movieMapperToDomainWithVideoCredits(movie: Movie, videos: [MovieVideo], casts: [MovieCast]) -> Movie {
        let videoTrailer = videos.filter { $0.name == "Official Trailer"}
        let casts = casts.filter { $0.departement == "Acting" && $0.popularity > 10.000 }.sorted{ $0.popularity > $1.popularity }
        return Movie(
            movieID: movie.movieID,
            title: movie.title,
            posterPath: movie.posterPath,
            backdropPath: movie.backdropPath,
            releaseDate: movie.releaseDate,
            description: movie.description,
            adult: movie.adult,
            duration: movie.duration,
            country: movie._productionHouse.first?.country ?? "-",
            productionHouse: movie._productionHouse.first?.name ?? "-",
            trailer: videoTrailer.first ?? MovieVideo(),
            casts: casts,
            rating: round(movie.rating * 10) / 10.0
        )
    }
}
