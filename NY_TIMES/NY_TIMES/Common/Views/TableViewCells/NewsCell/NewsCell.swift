//
//  NewsCell.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit
import AlamofireImage

class NewsCell: UITableViewCell {
    
    static let cellID = "NewsCell"
    
    @IBOutlet weak var updatedLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsTextView: UITextView!
    @IBOutlet weak var addToFavoriteBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImageView.layer.masksToBounds = true
        cellImageView.layer.borderColor = UIColor.lightGray.cgColor
        cellImageView.layer.borderWidth = 1.0 / UIScreen.main.scale
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        cellImageView.af_cancelImageRequest()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        cellImageView.layer.cornerRadius = cellImageView.frame.width / 2.0
    }

    func configure(with item: NewsViewItemInterface) {
        if let url = item.thumbnailURL {
            cellImageView.af_setImage(withURL: url, placeholderImage: UIImage(named: "noImage"), completion: nil)
        }
        else {
            cellImageView.image = UIImage(named: "noImage")
        }
        
        updatedLabel.text = item.updatedDate
        authorLabel.text = item.author
        newsTextView.text = item.news ?? ""
        titleLabel.text = item.newsTitle
    }
    
}
