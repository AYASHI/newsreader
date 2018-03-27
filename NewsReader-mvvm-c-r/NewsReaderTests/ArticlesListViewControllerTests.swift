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
    
    func articles() -> [Article] {
        let testBundle = Bundle(for: type(of: self))
        let mostPopularUrl = testBundle.url(forResource: "mostpopular", withExtension: "json")!
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.yyyyMMdd)
        
        let data = try! Data(contentsOf: mostPopularUrl)
        let response = try! decoder.decode(Response.self, from: data)

        return response.articles
    }
    
    override func setUp() {
        super.setUp()
        
        controller = ArticlesListViewController.create(of: .articlesList)
        controller.loadView()
        controller.tableView.registerNib(NewsCell.reuseIdentifier)
        controller.articles = self.articles()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTableViewLayout() {
        let numberOfRows = controller.tableView(controller.tableView, numberOfRowsInSection: 0)
        XCTAssertEqual(numberOfRows, 2)
        
        let firstArticle = controller.articles[0]
        let firstCell = controller.tableView(controller.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) as! NewsCell
        XCTAssertEqual(firstCell.headLine.text, firstArticle.title)
        XCTAssertEqual(firstCell.dateLabel.text, DateFormatter.medium.string(from: firstArticle.published))
        XCTAssertEqual(firstCell.writtenByLabel.text, firstArticle.writtenBy)
        
        let secondArticle = controller.articles[1]
        let secondCell = controller.tableView(controller.tableView, cellForRowAt: IndexPath(row: 1, section: 0)) as! NewsCell
        XCTAssertEqual(secondCell.headLine.text, secondArticle.title)
        XCTAssertEqual(secondCell.dateLabel.text, DateFormatter.medium.string(from: secondArticle.published))
        XCTAssertEqual(secondCell.writtenByLabel.text, secondArticle.writtenBy)
    }
    
}
