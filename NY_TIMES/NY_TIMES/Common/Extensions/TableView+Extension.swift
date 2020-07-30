//
//  TableView+Extension.swift
//  Quotes
//
//  Created by Saul Goodman on 05.03.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit

extension UITableView {
    
    func basicSettingsWith(_ view: UIViewController) {
        self.tableFooterView = UIView()
        self.keyboardDismissMode = .onDrag
        self.delegate = view as? UITableViewDelegate
        self.dataSource = view as? UITableViewDataSource
    }
    
    func reloadDataOnMainQueue() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.reloadData()
        }
    }
    
    func scrollToTop() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        }
    }
}
