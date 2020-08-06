//
//  NewsPresenter.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright (c) 2020 Shvets. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class NewsPresenter {

    // MARK: - Private properties -

    private unowned let view: NewsViewInterface
    private let interactor: NewsInteractorInterface
    private let wireframe: NewsWireframeInterface
    private var timer: Timer?
    
    private var isNeedUpdateAfterNoConnection = false
    
    var news = [News]() {
        didSet {
            view.endRefreshing()
            view.reloadData()
        }
    }
    
    private var type: NewsCategory!

    // MARK: - Lifecycle -

    init(view: NewsViewInterface, interactor: NewsInteractorInterface, wireframe: NewsWireframeInterface, type: NewsCategory) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.type = type
    }
    
    //MARK: - private
    private func getNews() {
        guard Reachability.isConnectedToNetwork() else {
            isNeedUpdateAfterNoConnection = true
            news = [News]()
            view.endRefreshing()
            view.setLoadingVisible(false)
            view.setNoConnectionVisible(true)
            return
        }
        
        setTimer()
        view.setNoConnectionVisible(false)
        
        interactor.getNewsBy(category: self.type, period: 30) { [weak self] (news, error) in
            
            self?.view.setLoadingVisible(false)
            self?.timer?.invalidate()
            
            if let news = news {
                self?.news = news.sorted(by: { $0.updated! > $1.updated! })
                self?.isNeedUpdateAfterNoConnection = false
            }
            else if let _ = error {
                
            }
        }
    }
    
    private func deleteFromFavorites(index: Int) {
        interactor.deleteNews(news: [news[index]]) { [weak self] success in
            if success {
                self?.view.reloadData()
            }
        }
    }
    
    private func setTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 20, repeats: false, block: { [weak self] timer in
            
            self?.view.endRefreshing()
            timer.invalidate()
        })
    }
}

// MARK: - EmailedPresenterInterface
extension NewsPresenter: NewsPresenterInterface {
    func refreshData() {
        getNews()
    }
    
    func favoritesButtonDidClick(_ index: Int) {
        interactor.addNewsToFavorites(news: news[index]) { [weak self] success, error in
            if success {
                self?.view.reloadData()
            }
            else if let err = error {
                
                switch err {
                case CoreDataError.suchRecordExists:
                    self?.deleteFromFavorites(index: index)
                default:
                    break
                }
            }
        }
    }
    
    func item(at indexPath: IndexPath) -> NewsViewItemInterface {
        return news[indexPath.row]
    }
    
    func viewDidLoad() {
        view.setLoadingVisible(true)
        view.setNavigationTitle(type.getCategoryString())
        getNews()
    }
    
    func viewWillAppear() {
        if isNeedUpdateAfterNoConnection {
            view.setLoadingVisible(true)
            refreshData()
        }
        else {
            view.reloadData()
        }
    }
    
    func numberOfItems(in section: Int) -> Int {
        return news.count
    }
    
    func didSelectRowAtIndexPath(_ indexPath: IndexPath) {
        wireframe.navigate(to: .details(news[indexPath.row]))
    }
}
