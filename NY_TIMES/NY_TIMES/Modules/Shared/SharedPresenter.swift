//
//  SharedPresenter.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright (c) 2020 Shvets. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class SharedPresenter {

    // MARK: - Private properties -

    private unowned let view: SharedViewInterface
    private let interactor: SharedInteractorInterface
    private let wireframe: SharedWireframeInterface

    // MARK: - Lifecycle -

    init(view: SharedViewInterface, interactor: SharedInteractorInterface, wireframe: SharedWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

// MARK: - Extensions -

extension SharedPresenter: SharedPresenterInterface {
}
