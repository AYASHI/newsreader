//
//  ArticlesListCoordinator.swift
//  NewsReader
//
//  Created by Jose Jeria on 26.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import UIKit

class ArticlesListCoordinator: Coordinator {
    
    private let navigationController: UINavigationController
    private var articlesListViewController: ArticlesListViewController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let articlesListViewController = ArticlesListViewController.create(of: .articlesList)
        articlesListViewController.delegate = self
        articlesListViewController.title = "Most Popular"
        self.articlesListViewController = articlesListViewController
        
        navigationController.viewControllers = [articlesListViewController]
    }

}

extension ArticlesListCoordinator: ArticlesListViewControllerDelegate {
    
    func didSelectArticle(_ article: Article) {
        let articleDetailViewController = ArticleDetailViewController.create(of: .articleDetail)
        articleDetailViewController.article = article
        navigationController.pushViewController(articleDetailViewController, animated: true)
    }
    
}
