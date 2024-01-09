//
//  APITarget.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 30/12/23.
//

import Foundation
import Alamofire

protocol APIFactory {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: Encodable { get }
}
