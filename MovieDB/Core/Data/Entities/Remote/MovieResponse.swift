//
//  MovieReponse.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 30/12/23.
//

import Foundation
import ObjectMapper

extension Movies: Mappable {
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        page    <- map["page"]
        movies  <- map["results"]
    }
    
}

extension Movie: Mappable {
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        movieID         <- map["id"]
        title           <- map["title"]
        posterPath      <- map["poster_path"]
        backdropPath    <- map["backdrop_path"]
        adult           <- map["adult"]
        releaseDate     <- map["release_date"]
        description     <- map["overview"]
        duration        <- map["runtime"]
        _productionHouse <- map["production_companies"]
        rating          <- map["vote_average"]
    }
    
}

extension MovieVideos: Mappable {

    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        id      <- map["id"]
        videos  <- map["results"]
    }
    
}

extension MovieVideo: Mappable {
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        name        <- map["name"]
        platform    <- map["site"]
        keyPath     <- map["key"]
        type        <- map["type"]
    }
    
}

extension MoviePH: Mappable {
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        name    <- map["name"]
        country <- map["origin_country"]
    }
    
}

extension MovieCasts: Mappable {
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        movieID <- map["id"]
        casts   <- map["cast"]
    }
    
}

extension MovieCast: Mappable {
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        name            <- map["name"]
        nameCharacter   <- map["character"]
        departement     <- map["known_for_department"]
        popularity      <- map["popularity"]
        profilePath     <- map["profile_path"]
    }
    
}
