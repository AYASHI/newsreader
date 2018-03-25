//
//  ArticlesListViewModel.swift
//  NewsReader
//
//  Created by Jose Jeria on 16.03.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import Foundation

protocol ArticlesListViewModelDelegate: class {
    
    func articlesDidChange()
    func articlesFailedToLoad(with errorMessage: String)
    
}

class ArticlesListViewModel {
    
    private let apiManager: NewsApiManager
    var articles: [Article] = [] {
        didSet {
            viewDelegate?.articlesDidChange()
        }
    }
    weak var viewDelegate: ArticlesListViewModelDelegate?
    
    init(with apiManager: NewsApiManager) {
        self.apiManager = apiManager
    }
 
    func fetchArticles() {
        apiManager.mostPopular(onSuccess: { [weak self] articles in
            self?.articles = articles
        }) { [weak self] errorMessage in
            self?.viewDelegate?.articlesFailedToLoad(with: errorMessage)
        }
    }
    
}
