//
//  ArticlesRepository.swift
//  NewsReader
//
//  Created by Jose Jeria on 27.03.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import Foundation

protocol ArticlesRepository {
    
    func fetchArticles(onSuccess: @escaping (_ articles: [Article]) -> Void, onError: @escaping (_ errorMessage: String) -> Void)
    
}

class DefaultArticlesRepository: ArticlesRepository {
    
    
    private let newsApiClient: NewsApiClient
    
    init(with newsApiClient: NewsApiClient) {
        self.newsApiClient = newsApiClient
    }
    

    func fetchArticles(onSuccess: @escaping ([Article]) -> Void, onError: @escaping (String) -> Void) {
        newsApiClient.mostPopular(onSuccess: onSuccess, onError: onError)
    }
    
}
