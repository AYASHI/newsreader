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
    private let newsApiClient: NewsApiClient
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.newsApiClient = NewsApiClient()
    }
    
    func start() {
        let articlesRepository = ArticlesRepository(with: newsApiClient)
        let viewModel = ArticlesListViewModel(with: articlesRepository)
        
        let articlesListViewController = ArticlesListViewController.create(of: .articlesList)
        articlesListViewController.viewModel = viewModel
        articlesListViewController.delegate = self
        articlesListViewController.title = "Most Popular"
        self.articlesListViewController = articlesListViewController
        
        navigationController.viewControllers = [articlesListViewController]
    }

}

extension ArticlesListCoordinator: ArticlesListViewControllerDelegate {
    
    func didSelectArticle(_ article: Article) {
        let viewModel = ArticleDetailViewModel(with: article)
        
        let articleDetailViewController = ArticleDetailViewController.create(of: .articleDetail)
        articleDetailViewController.viewModel = viewModel
        navigationController.pushViewController(articleDetailViewController, animated: true)
    }
    
}
