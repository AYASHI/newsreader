//
//  DateFormatter+Extensions.swift
//  NewsReader
//
//  Created by Jose Jeria on 25.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static let yyyyMMdd: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
 
    static let medium: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
}
