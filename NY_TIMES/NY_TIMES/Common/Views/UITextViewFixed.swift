//
//  UITextViewFixed.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 01.08.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit

@IBDesignable class UITextViewFixed: UITextView {
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    
    func setup() {
        textContainer.lineFragmentPadding = 0
    }
}
