//
//  ArticleDetailViewController.swift
//  NewsReader
//
//  Created by Jose Jeria on 24.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var columnTypeLabel: UILabel!
    @IBOutlet weak var writtenByLabel: UILabel!
    @IBOutlet weak var dateWrittenLabel: UILabel!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var abstractLabel: UILabel!
    
    var viewModel: ArticleDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        headlineLabel.text = viewModel.article.title
        abstractLabel.text = viewModel.article.abstract
        columnTypeLabel.text = viewModel.article.column?.uppercased()
        articleImageView.kf.setImage(with: viewModel.article.largeImageUrl, options: [.transition(.fade(0.3))])
        writtenByLabel.text = viewModel.article.writtenBy
        dateWrittenLabel.text = DateFormatter.medium.string(from: viewModel.article.published)
    }
    
}
