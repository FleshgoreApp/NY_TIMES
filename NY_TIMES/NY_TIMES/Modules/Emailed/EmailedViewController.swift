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
    
    // MARK: - properties
    lazy var activityView: CustomActivityIndicatorView = {
        return CustomActivityIndicatorView(parentView: self.view)
    }()

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
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.cellID, for: indexPath) as? NewsCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: presenter.item(at: indexPath))
        
        return cell
    }
    
}

//MARK: - UITableViewDelegate
extension EmailedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectRowAtIndexPath(indexPath)
    }
    
}

//MARK: - EmailedViewInterface
extension EmailedViewController: EmailedViewInterface {
    func reloadData() {
        tableView?.reloadDataOnMainQueue()
    }
    
    func setLoadingVisible(_ visible: Bool) {
        visible ? activityView.showActivityIndicator() : activityView.hideActivityIndicator()
    }
    
    func showAlertWith(title: String?, message: String) {
        showAlertWithOkButton(title: title, message: message)
    }
}


