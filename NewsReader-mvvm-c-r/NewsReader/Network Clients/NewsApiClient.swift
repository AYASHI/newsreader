//
//  NewsApiClient.swift
//  NewsReader
//
//  Created by Jose Jeria on 21.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import Foundation

class NewsApiClient {
    
    // MARK: - Public
    
    func mostPopular(onSuccess: @escaping ([Article]) -> Void, onError: @escaping (String) -> Void) {
        dataTask?.cancel()
        dataTask = urlSession.dataTask(with: apiRequest) { data, response, error in
            guard error == nil, let data = data, let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                onError("Request failed")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .formatted(DateFormatter.yyyyMMdd)
                
                let response = try decoder.decode(Response.self, from: data)
                let sortedArticlesByDate = response.articles.sorted { $0.published > $1.published }
                
                DispatchQueue.main.async {
                    onSuccess(sortedArticlesByDate)
                }
            } catch let error {
                DispatchQueue.main.async {
                    onError("Decode error: \(error)")
                    return
                }
            }
        }
        dataTask?.resume()
    }
    
    // MARK: - Private
    
    private var dataTask: URLSessionDataTask?
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
