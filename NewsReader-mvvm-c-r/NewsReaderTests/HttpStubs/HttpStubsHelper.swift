//
//  HttpStubsHelper.swift
//  NewsReaderTests
//
//  Created by Jose Jeria on 26.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import OHHTTPStubs

class HttpStubsHelper {
    
    static let ContentType = "Content-Type"
    static let ContentTypeJson = "application/json" as Any
    static let baseUrlHost = "api.nytimes.com"
    
    enum RequestType: String {
        case mostPopular = "mostpopular.json"
    }
    
    static func stubResponseFor(requestType: RequestType, baseUrl: String = baseUrlHost) {
        
        stub(condition: isHost(baseUrl)) { _ in
            let stubPath = OHPathForFile(requestType.rawValue, self)!
            return fixture(filePath: stubPath, headers: [ContentType: ContentTypeJson])
        }
        
    }
    
}
