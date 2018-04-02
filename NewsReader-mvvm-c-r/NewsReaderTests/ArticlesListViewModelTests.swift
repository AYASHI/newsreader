//
//  ArticlesListViewModelTests.swift
//  NewsReaderTests
//
//  Created by Jose Jeria on 28.03.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import XCTest
@testable import NewsReader

class ArticlesListViewModelTests: XCTestCase {
    
    var viewModel: ArticlesListViewModel!
    
    override func setUp() {
        super.setUp()
        
        let  articlesRepository = MockArticlesRepository()
        viewModel = DefaultArticlesListViewModel(with: articlesRepository)
    }

    func testArticlesListViewModel() {
        var articlesDidChange = false

        viewModel.articlesDidChange.add {
            articlesDidChange = true
        }
        viewModel.fetchArticles()
        
        XCTAssertTrue(articlesDidChange)
        XCTAssertEqual(viewModel.articles.count, 2)
    }
    
}
