//
//  Article.swift
//  NewsReader
//
//  Created by Jose Jeria on 24.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import Foundation

struct Article: Codable {
    
    let abstract: String
    let url: URL
    let column: String?
    let section: String
    let writtenBy: String
    let title: String
    let published: Date
    let source: String
    let media: [Media]
    var thumbnailUrl: URL? {
        return imageUrl(for: .thumbnail)
    }
    var largeImageUrl: URL? {
        return imageUrl(for: .large)
    }
    
    enum CodingKeys: String, CodingKey {
        case abstract
        case url
        case column
        case section
        case writtenBy = "byline"
        case title
        case published = "published_date"
        case source
        case media
    }
    
    private enum ImageType: String {
        case thumbnail = "Standard Thumbnail"
        case large = "Large"
    }
    
    private func imageUrl(for imageType: ImageType) -> URL? {
        guard let media = media.first else {
            return nil
        }
        
        let thumbnailData = media.metaData.first {
            $0.format == imageType.rawValue
        }
        
        return thumbnailData?.url
    }
    
}

extension Article: CustomStringConvertible {
    
    var description: String {
        return "title: \(title), column: \(String(describing: column)), abstract: \(abstract), writtenBy: \(writtenBy)"
    }
    
}

