//
//  Cast.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 10/01/24.
//

import Foundation


struct MovieCasts: Identifiable {
    var id: UUID = UUID()
    var movieID: Int = 0
    var casts: [MovieCast] = []
}

struct MovieCast: Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var popularity: Double = 0.0
    var nameCharacter: String = ""
    var departement: String = ""
    var profilePath: String = ""
}

/*
 {
"id": 181808,
"cast": [
     {
       "adult": false,
       "gender": 2,
       "id": 2,
       "known_for_department": "Acting",
       "name": "Mark Hamill",
       "original_name": "Mark Hamill",
       "popularity": 56.153,
       "profile_path": "/2ZulC2Ccq1yv3pemusks6Zlfy2s.jpg",
       "cast_id": 14,
       "character": "Luke Skywalker / Dobbu Scay (voice)",
       "credit_id": "5679cdd4c3a3685bbf000206",
       "order": 0
     }
 ]
 */
