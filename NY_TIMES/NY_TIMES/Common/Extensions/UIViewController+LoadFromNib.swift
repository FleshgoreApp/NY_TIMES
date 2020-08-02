//
//  UIViewController+LoadFromNib.swift
//  111
//
//  Created by Saul Goodman on 22.07.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
