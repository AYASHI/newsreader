//
//  Response.swift
//  NewsReader
//
//  Created by Jose Jeria on 24.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import Foundation

struct Response: Codable {

    let status: String
    let copyright: String
    let articlesCount: Int
    let articles: [Article]

    enum CodingKeys: String, CodingKey {
        case status
        case copyright
        case articlesCount = "num_results"
        case articles = "results"
    }

}
