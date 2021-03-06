//
//  NewsViewController.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright (c) 2020 Shvets. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class NewsViewController: BaseViewController {
    
    // MARK: - properties
    lazy var activityView: CustomActivityIndicatorView = {
        return CustomActivityIndicatorView(parentView: self.view)
    }()

    var presenter: NewsPresenterInterface!

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }
    
    
    //MARK: - private
    private func setupTableView() {
        tableView?.basicSettingsWith(self, actionRC: #selector(refreshData))
    }
    
    @objc private func refreshData() {
        presenter.refreshData()
    }
}

//MARK: - UITableViewDataSource
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.cellID, for: indexPath) as? NewsCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: presenter.item(at: indexPath), view: self, indexPath: indexPath)
        
        return cell
    }
    
}

//MARK: - NewsCellDelegate
extension NewsViewController: NewsCellDelegate {
    func favoritesButtonDidClick(_ index: Int) {
        presenter.favoritesButtonDidClick(index)
    }
}

//MARK: - UITableViewDelegate
extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectRowAtIndexPath(indexPath)
    }
    
}

//MARK: - EmailedViewInterface
extension NewsViewController: NewsViewInterface {
    func setNoConnectionVisible(_ visible: Bool) {
        self.setNoConnection(visible)
    }
    
    func endRefreshing() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView?.refreshControl?.endRefreshing()
        }
    }
    
    func setNavigationTitle(_ title: String) {
        self.navigationItem.title = title
    }
    
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


