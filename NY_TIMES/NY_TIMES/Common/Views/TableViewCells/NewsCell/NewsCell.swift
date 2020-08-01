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
    
    //MARK: -
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImageView.layer.masksToBounds = true
        cellImageView.layer.borderColor = UIColor.lightGray.cgColor
        cellImageView.layer.borderWidth = 1.0 / UIScreen.main.scale
        setupFontSize()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        cellImageView.af_cancelImageRequest()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        cellImageView.layer.cornerRadius = cellImageView.frame.width / 2.0
    }

    //MARK: - Configuration
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
    
    //MARK: - Actions
    @IBAction func addToFavoritesDidClick(_ sender: UIButton) {
        print("FAV")
    }
    
    //MARK: - private
    private func setupFontSize() {
        titleLabel.font = Font.kCellTitle
        newsTextView.font = Font.kCellNews
    }
    
}
