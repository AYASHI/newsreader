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
    
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    func configureUI() {
        guard let article = article else {
            return
        }
        
        headlineLabel.text = article.title
        abstractLabel.text = article.abstract
        columnTypeLabel.text = article.column?.uppercased()
        articleImageView.kf.setImage(with: article.largeImageUrl, options: [.transition(.fade(0.3))])
        writtenByLabel.text = article.writtenBy
        dateWrittenLabel.text = DateFormatter.medium.string(from: article.published)
    }
    
}
