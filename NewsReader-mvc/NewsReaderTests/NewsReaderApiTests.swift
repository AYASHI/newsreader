//
//  NewsReaderApiTests.swift
//  NewsReaderTests
//
//  Created by Jose Jeria on 21.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import NewsReader

class NewsReaderApiTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        HttpStubsHelper.stubResponseFor(requestType: .mostPopular)
    }
    
    override func tearDown() {
        OHHTTPStubs.removeAllStubs()
        super.tearDown()
    }
    
    func testFetchArticles() {
        let apiExpectation = expectation(description: "")
        
        NewsApiManager.shared.mostPopular(onSuccess: { articles in
            
            // Test amount of articles
            XCTAssertEqual(articles.count, 2)

            // Test that articles were sorted by date
            let firstArticle = articles.first
            XCTAssertEqual(firstArticle?.writtenBy, "By NICHOLAS FANDOS")
            
            apiExpectation.fulfill()
            }, onError: { error in
                log.error(error)
        })
        
        wait(for: [apiExpectation], timeout: 0.5)
    }
    
    
}
