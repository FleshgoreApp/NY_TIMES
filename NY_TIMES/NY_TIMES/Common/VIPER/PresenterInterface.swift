//
//  PresenterInterface.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit

protocol PresenterInterface: class {
}

extension PresenterInterface {
}

protocol NewsPresenterInterface: PresenterInterface {
    func didSelectRowAtIndexPath(_ indexPath: IndexPath)
    var news: [News] { get }
    func viewDidLoad()
    func numberOfItems(in section: Int) -> Int
}
