//
//  InteractorInterface.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

protocol InteractorInterface: class {
}

extension InteractorInterface {
}

protocol NewsInteractorInterface {
    var network: Network { get }
    func getNewsBy(category: NewsCategory, period: Int, completion:@escaping NewsResponseBlock)
}
