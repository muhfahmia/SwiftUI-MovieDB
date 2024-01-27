//
//  Video.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 10/01/24.
//

import Foundation

struct MovieVideos {
    var id: Int = 0
    var videos: [MovieVideo] = [MovieVideo()]
}

struct MovieVideo: Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var platform: String = ""
    var keyPath: String = ""
    var type: String = ""
}
