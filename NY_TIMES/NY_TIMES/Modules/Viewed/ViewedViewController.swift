//
//  ViewedViewController.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright (c) 2020 Shvets. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class ViewedViewController: BaseViewController {

    // MARK: - Public properties -

    var presenter: ViewedPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
    }
    
    //MARK: - private
    private func setupNavigation() {
        self.navigationItem.title = "Viewed"
    }

}

// MARK: - Extensions -

extension ViewedViewController: ViewedViewInterface {
}