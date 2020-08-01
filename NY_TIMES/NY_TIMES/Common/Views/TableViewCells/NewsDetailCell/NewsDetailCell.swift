//
//  NewsDetailCell.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit

class NewsDetailCell: UITableViewCell {

    static let cellID = "NewsDetailCell"
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsTextView: UITextView!

    override func awakeFromNib() {
        setupFontSize()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellImageView.af_cancelImageRequest()
    }

    func configure(with item: NewsViewItemInterface) {
        if let url = item.imageURL {
            cellImageView.af_setImage(withURL: url, placeholderImage: UIImage(named: "noImage"), completion: nil)
        }
        else {
            cellImageView.image = UIImage(named: "noImage")
        }
        
        newsTextView.text = item.news ?? ""
        titleLabel.text = item.newsTitle
    }
    
    private func setupFontSize() {
        titleLabel.font = Font.kCellTitle
        newsTextView.font = Font.kCellNews
    }
    
}
