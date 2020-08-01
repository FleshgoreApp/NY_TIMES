//
//  EmailedInterfaces.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright (c) 2020 Shvets. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol NewsWireframeInterface: WireframeInterface {
    
}

protocol NewsViewInterface: ViewInterface {
    func reloadData()
    func setLoadingVisible(_ visible: Bool)
    func setNavigationTitle(_ title: String)
    func showAlertWith(title: String?, message: String)
}

protocol NewsPresenterInterface: PresenterInterface {
    func item(at indexPath: IndexPath) -> NewsViewItemInterface
    func didSelectRowAtIndexPath(_ indexPath: IndexPath)
    var news: [News] { get }
    func viewDidLoad()
    func numberOfItems(in section: Int) -> Int
}

protocol NewsInteractorInterface: InteractorInterface {
    var network: Network { get }
    func getNewsBy(category: NewsCategory, period: Int, completion:@escaping NewsResponseBlock)
}
