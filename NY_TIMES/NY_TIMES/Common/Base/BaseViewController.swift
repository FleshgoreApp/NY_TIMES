//
//  BaseViewController.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    //MARK - properties
    @IBOutlet weak var tableView: UITableView?
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupTableView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    //MARK: - Private
    
    private func setupView() {
        self.view.backgroundColor = UIColor.white
    }
    
    private func setupTableView() {
        tableView?.register(UINib(nibName: NewsCell.cellID, bundle: nil), forCellReuseIdentifier: NewsCell.cellID)
    }
}
