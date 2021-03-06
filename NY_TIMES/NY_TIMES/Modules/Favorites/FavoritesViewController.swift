//
//  FavoritesViewController.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright (c) 2020 Shvets. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class FavoritesViewController: BaseViewController {

    // MARK: - Public properties -

    var presenter: FavoritesPresenterInterface!

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
        tableView?.basicSettingsWith(self)
    }
}

//MARK: - UITableViewDataSource
extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NewsCell.cellID, for: indexPath) as? NewsCell else {
            return UITableViewCell()
        }
        
        cell.configure(with: presenter.item(at: indexPath), indexPath: indexPath, hideFavoritesButton: true)
        
        return cell
    }
    
}

//MARK: - UITableViewDelegate
extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] _, _, complete in
            
            self?.presenter.trailingSwipeActionsForRowAt(indexPath: indexPath)
            
            complete(true)
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        
        return configuration
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didSelectRowAtIndexPath(indexPath)
    }
    
}

// MARK: - FavoritesViewInterface
extension FavoritesViewController: FavoritesViewInterface {
    func deleteRowAtIndexPath(_ indexPath: IndexPath) {
        DispatchQueue.main.async { [weak self] in
            self?.tableView?.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func setNavigationTitle(_ title: String) {
        self.navigationItem.title = title
    }
    
    func reloadData() {
        tableView?.reloadDataOnMainQueue()
    }
    
    func showAlertWith(title: String?, message: String) {
        
    }
}
