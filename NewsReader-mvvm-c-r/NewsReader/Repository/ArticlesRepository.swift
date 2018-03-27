//
//  ArticlesRepository.swift
//  NewsReader
//
//  Created by Jose Jeria on 27.03.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import Foundation

protocol ArticlesRepository {
    
    func fetchArticles()
    
}

class DefaultArticlesRepository: ArticlesRepository {
    
    private let newsApiClient: NewsApiClient
    
    init(with newsApiClient: NewsApiClient) {
        self.newsApiClient = newsApiClient
    }
    
    func fetchArticles() {
        newsApiClient.mostPopular(onSuccess: { [weak self] articles in
//            self?.articles = articles
        }) { [weak self] errorMessage in
           // self?.viewDelegate?.articlesFailedToLoad(with: errorMessage)
        }
    }
    
}
