//
//  NewsCell.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit
import AlamofireImage

protocol NewsCellDelegate: class {
    func favoritesButtonDidClick(_ index: Int)
}

class NewsCell: UITableViewCell {
    
    static let cellID = "NewsCell"
    
    @IBOutlet private weak var favoritesButton: UIButton!
    @IBOutlet private weak var updatedLabel: UILabel!
    @IBOutlet private weak var cellImageView: UIImageView!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var newsTextView: UITextView!
    
    private weak var delegate: NewsCellDelegate?
    private var indexPath: IndexPath!
    
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
    func configure(with item: NewsViewItemInterface, view: NewsCellDelegate? = nil, indexPath: IndexPath, hideFavoritesButton: Bool = false) {
        if let url = item.thumbnailURL {
            cellImageView.af_setImage(withURL: url, placeholderImage: UIImage(named: "noImage"), completion: nil)
        }
        else {
            cellImageView.image = item.thumbnailFromDB
        }
        
        updatedLabel.text = item.updatedDate
        authorLabel.text = item.author
        newsTextView.text = item.news ?? ""
        titleLabel.text = item.newsTitle
        
        self.indexPath = indexPath
        self.delegate = view
        
        setFavoritesButtonColor(isFavorites: item.isFavoritesNews)
        favoritesButton.isHidden = hideFavoritesButton
    }
    
    //MARK: - Actions
    @IBAction func addToFavoritesDidClick(_ sender: UIButton) {
        delegate?.favoritesButtonDidClick(indexPath.row)
    }
    
    //MARK: - private
    private func setupFontSize() {
        titleLabel.font = Font.kCellTitle
        newsTextView.font = Font.kCellNews
    }
    
    private func setFavoritesButtonColor(isFavorites: Bool) {
        if let imageView = favoritesButton.imageView {
            imageView.setTintColor(isFavorites ? UIColor.red : UIColor.darkGray)
        }
    }
}
