//
//  ModelTests.swift
//  NewsReaderTests
//
//  Created by Jose Jeria on 26.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import XCTest

class ModelTests: XCTestCase {
    
    func testModel() {
        let thumbnailMetaData = MetaData(format: "Standard Thumbnail", width: 100, height: 100, url: URL(string: "thumbanil.example.com")!)
        let largeMetaData = MetaData(format: "Large", width: 100, height: 100, url: URL(string: "large.example.com")!)
        let media = Media(type: "imageData", metaData: [thumbnailMetaData, largeMetaData])
        let article = Article(abstract: "abstract", url: URL(string: "example.com")!, column: nil, section: "section", writtenBy: "author", title: "title", published: Date(), source: "source", media: [media])
        
        XCTAssertEqual(article.thumbnailUrl, thumbnailMetaData.url)
        XCTAssertEqual(article.largeImageUrl, largeMetaData.url)
    }
    
}
