//
//  UITableView+Extension.swift
//  Quotes
//
//  Created by Saul Goodman on 05.03.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit

extension UITableView {
    
    func basicSettingsWith(_ view: UIViewController, actionRC: Selector? = nil) {
        if let action = actionRC {
            let rc = UIRefreshControl()
            self.refreshControl = rc
            rc.addTarget(view, action: action, for: .valueChanged)
        }
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
