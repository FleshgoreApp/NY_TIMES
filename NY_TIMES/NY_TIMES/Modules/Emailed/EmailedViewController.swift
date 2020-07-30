//
//  EmailedViewController.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright (c) 2020 Shvets. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class EmailedViewController: BaseViewController {

    // MARK: - Public properties -

    var presenter: EmailedPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        setupNavigation()
    }
    
    //MARK: - private
    private func setupNavigation() {
        self.navigationItem.title = VCTitle.kEmailed
    }

}

//MARK: - UITableViewDataSource
extension EmailedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

//MARK: - UITableViewDelegate
extension EmailedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectRowAtIndexPath(indexPath)
    }
    
}

//MARK: - EmailedViewInterface
extension EmailedViewController: EmailedViewInterface {
    
}


