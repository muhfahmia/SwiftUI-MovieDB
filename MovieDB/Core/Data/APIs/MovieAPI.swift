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
        }
    }

    var headers: [String : String]? {
        nil
    }
    
    var method: HTTPMethod {
        .get
    }
    
}
