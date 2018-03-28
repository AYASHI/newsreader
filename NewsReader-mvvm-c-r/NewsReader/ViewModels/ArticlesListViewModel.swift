//
//  ArticlesListViewModel.swift
//  NewsReader
//
//  Created by Jose Jeria on 16.03.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import Foundation
import TABObserverSet

class ArticlesListViewModel {
    
    let articlesRepository: ArticlesRepository
    var articles: [Article] = []
    var articlesDidChange = ObserverSet<Void>()
    var articlesFailed = ObserverSet<String>()
    
    init(with articlesRepository: ArticlesRepository) {
        self.articlesRepository = articlesRepository
    }
    
    func fetchArticles() {
        articlesRepository.fetchArticles(onSuccess: { [weak self] articles in
            self?.articles = articles
            self?.articlesDidChange.notify()
        }) { [weak self] errorMessage in
            self?.articlesFailed.notify(errorMessage)
        }
    }
    
}
