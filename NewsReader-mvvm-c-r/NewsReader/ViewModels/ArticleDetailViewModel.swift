//
//  ArticleDetailViewModel.swift
//  NewsReader
//
//  Created by Jose Jeria on 22.03.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import Foundation

protocol ArticleDetailViewModel {
    
    var article: Article { get }
    
}

class DefaultArticleDetailViewModel: ArticleDetailViewModel {
    
    let article: Article
    
    init(with article: Article) {
        self.article = article
    }
    
}
