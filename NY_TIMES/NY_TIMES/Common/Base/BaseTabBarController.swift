//
//  BaseTabBarController.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        basicSettings()
    }
    
    //MARK: - Private
    private func basicSettings() {
        self.tabBar.isTranslucent = false
        self.tabBar.unselectedItemTintColor = UIColor.gray
        self.tabBar.tintColor = UIColor.systemBlue
    }
}
