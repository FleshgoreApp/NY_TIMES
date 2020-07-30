//
//  BaseNavigationController.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit

final class BaseNavigationController: UINavigationController {
    
    private let color = UIColor.gray
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        basicSettings()
    }
    
    //MARK: - Private
    private func basicSettings() {
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: color]
        UINavigationBar.appearance().tintColor = color
    }
    
}
