//
//  PresenterInterface.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit

protocol PresenterInterface: class {
    func viewDidLoad()
    func viewWillAppear()
    func numberOfItems(in section: Int) -> Int
    func didSelectRowAtIndexPath(_ indexPath: IndexPath)
}

extension PresenterInterface {
    func viewWillAppear() {}
    func didSelectRowAtIndexPath(_ indexPath: IndexPath) {}
}
