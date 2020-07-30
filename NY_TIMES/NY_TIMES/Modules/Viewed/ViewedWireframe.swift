//
//  ViewedWireframe.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright (c) 2020 Shvets. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class ViewedWireframe: BaseWireframe {

    // MARK: - Module setup -

    init() {
        let moduleViewController = ViewedViewController()
        super.init(viewController: moduleViewController)

        let interactor = ViewedInteractor()
        let presenter = ViewedPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension ViewedWireframe: ViewedWireframeInterface {
}