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
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsTextView: UITextView!
    
    override func awakeFromNib() {
        
    }
    
}
