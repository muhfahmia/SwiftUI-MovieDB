//
//  MovieAPI.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 30/12/23.
//

import Foundation
import Alamofire

enum MovieAPI {
    case list(param: MovieListParameter)
    case detail(param: MovieDetailParameter)
    case videos(param: MovieDetailParameter)
    case credits(param: MovieDetailParameter)
}

extension MovieAPI: APIFactory {
    
    var baseURL: URL {
        URL(string: Constants.baseUrl)!
    }
    
    var parameters: Encodable {
        switch self {
        case .list(let param):
            return param
        case .detail(let param):
            return param
        case .videos(let param):
            return param
        case .credits(let param):
            return param
        }
    }
    
    var path: String {
        switch self {
        case .list(let param):
            if param.type == .trending {
                return "trending/movie/week"
            } else {
                return "movie/\(param.type.rawValue)"
            }
        case .detail(let param):
            return "movie/\(param.movieID)"
        case .videos(let param):
            return "movie/\(param.movieID)/videos"
        case .credits(let param):
            return "movie/\(param.movieID)/credits"
        }
    }

    var headers: [String : String]? {
        nil
    }
    
    var method: HTTPMethod {
        .get
    }
    
}
