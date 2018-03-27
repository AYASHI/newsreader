//
//  ArticlesListViewModel.swift
//  NewsReader
//
//  Created by Jose Jeria on 16.03.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import Foundation

class ArticlesListViewModel {
    
    let articlesRepository: ArticlesRepository
    var articles: [Article] = [] // observable
    
    init(with articlesRepository: ArticlesRepository) {
        self.articlesRepository = articlesRepository
    }
    
    func fetchArticles() {
//        articleRepository.fetchArticles() { [weak self] articles in
//            self?.articles = articles
//        }
    }
    
}
