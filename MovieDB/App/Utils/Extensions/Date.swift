//
//  SafeAreaInsets.swift
//  MovieDB
//
//  Created by Muhammad Fahmi on 11/01/24.
//

import Foundation

extension Date {
    
    func toString(format: String = "yyyy-MM-dd'T'HH:mm:ss'Z'") -> String {
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = format
      dateFormatter.locale = Locale.init(identifier: "id")
      return dateFormatter.string(from: self)
    }
    
}


