//
//  ArticlesListViewController.swift
//  NewsReader
//
//  Created by Jose Jeria on 21.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import UIKit

protocol ArticlesListViewControllerDelegate: class {
    
    func didSelectArticle(_ article: Article)
    
}

class ArticlesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    weak var delegate: ArticlesListViewControllerDelegate?
    var viewModel: ArticlesListViewModel!
    let refreshControl = UIRefreshControl()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRefreshControl()
        setupTableView()
        setupViewModelObservers()
        fetchArticles()
    }
        
    // MARK: - Setup
    
    func setupViewModelObservers() {
        viewModel.articlesDidChange.add { [weak self] _ in
            self?.tableView.reloadData()
        }
        
        viewModel.articlesFailed.add { errorMessage in
            // handle error gracefully
        }
    }
    
    func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(fetchArticles), for: .valueChanged)
    }
    
    func setupTableView() {
        tableView.registerNib(NewsCell.reuseIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80.0
        tableView.refreshControl = refreshControl
    }
    
    @objc func fetchArticles() {
        viewModel.fetchArticles()
    }
    
}

// MARK: - UITableViewDataSource

extension ArticlesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = viewModel.articles[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseIdentifier, for: indexPath)
        (cell as? NewsCell)?.configure(with: article)
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension ArticlesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let article = viewModel.articles[indexPath.row]
        delegate?.didSelectArticle(article)
    }
    
}
