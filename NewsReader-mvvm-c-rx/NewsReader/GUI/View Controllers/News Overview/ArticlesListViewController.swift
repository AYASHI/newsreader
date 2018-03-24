//
//  ArticlesListViewController.swift
//  NewsReader
//
//  Created by Jose Jeria on 21.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import RxSwift
import RxCocoa

protocol ArticlesListViewControllerDelegate: class {
    
    func didSelectArticle(_ article: Article)
    
}

class ArticlesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: ArticlesListViewControllerDelegate?
    var viewModel: ArticlesListViewModel!
    let disposeBag = DisposeBag()
    let refreshControl = UIRefreshControl()
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRefreshControl()
        setupTableView()
        setupTableViewSelection()
    }
    
    // MARK: - Setup
    
    func setupRefreshControl() {
        refreshControl.rx.controlEvent(.valueChanged).asDriver()
            .drive(onNext: viewModel.mostPopularArticles)
            .disposed(by: disposeBag)
        
        viewModel.activityIndicator.asDriver()
            .drive(refreshControl.rx.isRefreshing)
            .disposed(by: disposeBag)
    }
    
    func setupTableView() {
        tableView.registerNib(NewsCell.reuseIdentifier)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80.0
        tableView.refreshControl = refreshControl
        
        viewModel.articles.asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: NewsCell.reuseIdentifier, cellType: NewsCell.self)) { _, article, cell in
                cell.configure(with: article)
            }
            .disposed(by: disposeBag)
    }
    
    func setupTableViewSelection() {
        tableView.rx.modelSelected(Article.self)
            .subscribe(onNext: { [weak self] article in
                guard let strongSelf = self, let selectedRowIndexPath = strongSelf.tableView.indexPathForSelectedRow else { return }
                
                strongSelf.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
                strongSelf.delegate?.didSelectArticle(article)
            })
            .disposed(by: disposeBag)
    }
    
}
