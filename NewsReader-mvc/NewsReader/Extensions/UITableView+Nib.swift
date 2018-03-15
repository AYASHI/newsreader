//
//  UITableView+Nib.swift
//  NewsReader
//
//  Created by Jose Jeria on 25.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerNib(_ nibName: String, bundle: Bundle? = nil) {
        register(UINib(nibName: nibName, bundle: bundle), forCellReuseIdentifier: nibName)
    }

}
