//
//  Media.swift
//  NewsReader
//
//  Created by Jose Jeria on 25.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import Foundation

struct Media: Codable {
    
    let type: String
    let metaData: [MetaData]

    enum CodingKeys: String, CodingKey {
        case type
        case metaData = "media-metadata"
    }
    
}

struct MetaData: Codable {
    
    let format: String
    let width: Int
    let height: Int
    let url: URL
    
}
