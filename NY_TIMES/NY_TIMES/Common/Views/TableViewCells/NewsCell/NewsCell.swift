//
//  NewsCell.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    static let cellID = "NewsCell"
    
    @IBOutlet weak var updatedLabel: UILabel!
    @IBOutlet weak var newsTopImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var newsTextView: UITextView!
    @IBOutlet weak var addToFavoriteBtn: UIButton!
    
}
