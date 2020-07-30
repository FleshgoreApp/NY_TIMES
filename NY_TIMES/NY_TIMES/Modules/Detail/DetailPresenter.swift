//
//  DetailPresenter.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright (c) 2020 Shvets. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class DetailPresenter {

    // MARK: - Private properties -

    private unowned let view: DetailViewInterface
    private let interactor: DetailInteractorInterface
    private let wireframe: DetailWireframeInterface

    var news: News?
    
    // MARK: - Lifecycle -

    init(view: DetailViewInterface, interactor: DetailInteractorInterface, wireframe: DetailWireframeInterface, news: News) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.news = news
    }
}

// MARK: - Extensions -

extension DetailPresenter: DetailPresenterInterface {
    func viewDidLoad() {
        view.setNavigationTitle(text: news?.title ?? "")
    }
}
