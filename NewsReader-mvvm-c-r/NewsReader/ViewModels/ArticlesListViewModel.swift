//
//  ArticlesListViewModel.swift
//  NewsReader
//
//  Created by Jose Jeria on 16.03.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import Foundation
import TABObserverSet

protocol ArticlesListViewModel {
    
    var articles: [Article] { get }
    var articlesDidChange: ObserverSet<Void> { get }
    var articlesFailed: ObserverSet<String> { get }
    func fetchArticles()
    
}

class DefaultArticlesListViewModel: ArticlesListViewModel {
    
    private let articlesRepository: ArticlesRepository
    var articles: [Article] = []
    let articlesDidChange = ObserverSet<Void>()
    let articlesFailed = ObserverSet<String>()
    
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
