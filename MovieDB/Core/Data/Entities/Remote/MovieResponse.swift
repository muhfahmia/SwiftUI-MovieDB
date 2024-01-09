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
        releaseDate     <- map["release_date"]
    }
    
}
