//
//  NewsCell.swift
//  NewsReader
//
//  Created by Jose Jeria on 25.02.18.
//  Copyright © 2018 José Jeria. All rights reserved.
//

import UIKit
import Kingfisher

class NewsCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView! {
        didSet {
            articleImageView.layer.cornerRadius = articleImageView.frame.size.width / 2
            articleImageView.clipsToBounds = true
        }
    }
    @IBOutlet weak var headLine: UILabel!
    @IBOutlet weak var writtenByLabel: UILabel!
    
    static let reuseIdentifier = "NewsCell"
    
    func configure(with article: Article) {
        dateLabel.text = DateFormatter.medium.string(from: article.published)
        headLine.text = article.title
        writtenByLabel.text = article.writtenBy
        articleImageView.kf.setImage(with: article.thumbnailUrl)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        articleImageView.image = nil
    }
    
}
