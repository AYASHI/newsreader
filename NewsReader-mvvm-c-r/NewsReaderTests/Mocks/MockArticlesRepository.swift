//
//  MockArticlesRepository.swift
//  NewsReaderTests
//
//  Created by Jose Jeria on 02.04.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import Foundation
@testable import NewsReader

class MockArticlesRepository: ArticlesRepository {
    
    func articles() -> [Article] {
        let testBundle = Bundle(for: type(of: self))
        let mostPopularUrl = testBundle.url(forResource: "mostpopular", withExtension: "json")!
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.yyyyMMdd)
        
        let data = try! Data(contentsOf: mostPopularUrl)
        let response = try! decoder.decode(Response.self, from: data)
        
        return response.articles
    }
    
    func fetchArticles(onSuccess: @escaping ([Article]) -> Void, onError: @escaping (String) -> Void) {
        onSuccess(articles())
    }
    
}
