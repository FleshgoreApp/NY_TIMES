//
//  EmailedWireframe.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright (c) 2020 Shvets. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class EmailedWireframe: BaseWireframe {

    // MARK: - Module setup -

    init() {
        let moduleViewController = EmailedViewController()
        super.init(viewController: moduleViewController)

        let interactor = EmailedInteractor()
        let presenter = EmailedPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension EmailedWireframe: EmailedWireframeInterface {
}