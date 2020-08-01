//
//  UIView+Extension.swift
//  Quotes
//
//  Created by Saul Goodman on 09.03.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit

extension UIView {
    
    func stretchToFitThe(parentView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            self.topAnchor.constraint(equalTo: parentView.topAnchor),
            self.trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor)
        ])
    }
}
