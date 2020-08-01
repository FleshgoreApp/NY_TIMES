//
//  ViewInterface.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

protocol ViewInterface: class {
}

extension ViewInterface {
}

protocol NewsViewInterfase: class {
    func reloadData()
    func setLoadingVisible(_ visible: Bool)
    func showAlertWith(title: String?, message: String)
}
