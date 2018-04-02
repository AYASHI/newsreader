//
//  ArticlesListViewControllerTests.swift
//  NewsReaderTests
//
//  Created by Jose Jeria on 26.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import XCTest
@testable import NewsReader

class ArticlesListViewControllerTests: XCTestCase {
    
    var controller: ArticlesListViewController!
    
    override func setUp() {
        super.setUp()
        
        let viewModel = DefaultArticlesListViewModel(with: MockArticlesRepository())
        
        controller = ArticlesListViewController.create(of: .articlesList)
        controller.viewModel = viewModel
        controller.loadView()
        controller.tableView.registerNib(NewsCell.reuseIdentifier)
        controller.viewModel.fetchArticles()
    }
    
    func testTableViewLayout() {
        let numberOfRows = controller.tableView(controller.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 2)
        
        let firstArticle = controller.viewModel.articles[0]
        let firstCell = controller.tableView(controller.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! NewsCell
        XCTAssertEqual(firstCell.headLine.text, firstArticle.title)
        XCTAssertEqual(firstCell.dateLabel.text, DateFormatter.medium.string(from: firstArticle.published))
        XCTAssertEqual(firstCell.writtenByLabel.text, firstArticle.writtenBy)
        
        let secondArticle = controller.viewModel.articles[1]
        let secondCell = controller.tableView(controller.tableView, cellForRowAt: IndexPath(row: 1, section: 0)) as! NewsCell
        XCTAssertEqual(secondCell.headLine.text, secondArticle.title)
        XCTAssertEqual(secondCell.dateLabel.text, DateFormatter.medium.string(from: secondArticle.published))
        XCTAssertEqual(secondCell.writtenByLabel.text, secondArticle.writtenBy)
    }
    
}
