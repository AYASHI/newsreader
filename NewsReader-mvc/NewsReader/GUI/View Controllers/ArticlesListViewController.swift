//
//  ArticlesListViewController.swift
//  NewsReader
//
//  Created by Jose Jeria on 21.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import UIKit

class ArticlesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let refreshControl = UIRefreshControl()
    var articles: [Article] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRefreshControl()
        setupTableView()
        setupCommunication()
    }
    
    // MARK: - Setup
    
    func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(setupCommunication), for: .valueChanged)
    }
    
    func setupTableView() {
        tableView.registerNib(NewsCell.reuseIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80.0
        tableView.refreshControl = refreshControl
    }
    
    @objc func setupCommunication() {
        NewsApiManager.shared.mostPopular(onSuccess: { [weak self] articles in
            DispatchQueue.main.async {
                self?.articles = articles
                self?.refreshControl.endRefreshing()
            }
            }, onError: { [weak self] error in
                DispatchQueue.main.async {
                    self?.refreshControl.endRefreshing()
                    // Handle error gracefully
                    log.error(error)
                }
        })
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailsController = segue.destination as? ArticleDetailViewController,
            let article = sender as? Article else {
                return
        }
        
        detailsController.article = article
    }
    
}

// MARK: - UITableViewDataSource

extension ArticlesListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = articles[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.reuseIdentifier, for: indexPath)
        (cell as? NewsCell)?.configure(with: article)
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension ArticlesListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let article = articles[indexPath.row]
        performSegue(withIdentifier: "ArticleDetailSegue", sender: article)
    }
    
}
