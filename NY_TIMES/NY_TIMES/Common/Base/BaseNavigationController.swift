//
//  BaseNavigationController.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit

final class BaseNavigationController: UINavigationController {
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        basicSettings()
    }
    
    //MARK: - Private
    private func basicSettings() {
        self.navigationBar.shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = UIColor.red
    }
    
}
