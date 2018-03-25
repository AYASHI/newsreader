//
//  NewsApiManager.swift
//  NewsReader
//
//  Created by Jose Jeria on 21.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import RxSwift
import RxCocoa

class NewsApiManager {
    
    // MARK: - Public
    
    func mostPopularArticles() -> Observable<[Article]> {
        return urlSession.rx.data(request: apiRequest)
            .map { data in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(DateFormatter.yyyyMMdd)
                
                let response = try! decoder.decode(Response.self, from: data)
                return response.articles.sorted { $0.published > $1.published }
        }
    }
    
    // MARK: - Private
    
    private let apiBaseUrl = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json"
    private let apiKey = "api-key"
    private var urlSession: URLSession {
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        
        return URLSession(configuration: configuration)
    }
    private var apiUrl: URL {
        return URL(string: apiBaseUrl)!.withQueryParams([apiKey: HttpConfiguration.apiKey])
    }
    
    private var apiRequest: URLRequest {
        var request = URLRequest(url: apiUrl)
        request.cachePolicy = .reloadRevalidatingCacheData
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json"
        ]
        
        return request
    }
    
}
