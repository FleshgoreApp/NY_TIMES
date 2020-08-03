//
//  ImageView+SetTintColor.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 03.08.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit

extension UIImageView {
    func setTintColor(_ color: UIColor) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.image = self.image?.withRenderingMode(.alwaysTemplate)
            self.tintColor = color
        }
    }
}
