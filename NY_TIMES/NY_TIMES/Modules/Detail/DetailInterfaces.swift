//
//  DetailInterfaces.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright (c) 2020 Shvets. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol DetailWireframeInterface: WireframeInterface {
}

protocol DetailViewInterface: ViewInterface {
    func setNavigationTitle(text: String)
}

protocol DetailPresenterInterface: PresenterInterface {
    func viewDidLoad()
    func numberOfItems(in section: Int) -> Int
    var news: NewsViewItemInterface? { get }
}

protocol DetailInteractorInterface: InteractorInterface {
}
