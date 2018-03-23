//
//  ApplicationCoordinator.swift
//  NewsReader
//
//  Created by Jose Jeria on 26.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import UIKit

class ApplicationCoordinator: Coordinator {
    
    let window: UIWindow
    let rootViewController: UINavigationController
    let articlesListCoordinator: ArticlesListCoordinator
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        articlesListCoordinator = ArticlesListCoordinator(navigationController: rootViewController)
    }
    
    func start() {
        window.rootViewController = rootViewController
        articlesListCoordinator.start()
        window.makeKeyAndVisible()
    }
    
}
