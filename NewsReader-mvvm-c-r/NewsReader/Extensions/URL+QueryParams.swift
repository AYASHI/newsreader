//
//  URL+QueryParams.swift
//  NewsReader
//
//  Created by Jose Jeria on 25.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import Foundation

extension URL {
    
    func withQueryParams(_ params: [String: String]) -> URL {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)!
        components.queryItems = params.map {
            URLQueryItem(name: $0, value: $1)
        }
        
        return components.url!
    }
    
}
