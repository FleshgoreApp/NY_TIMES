//
//  Enums.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import Foundation

enum NewsNavigationOption {
    case details(News)
}

enum NewsCategory: Int {
    case emailed  = 0
    case shared   = 1
    case viewed   = 2
    case favorite = 3
    
    func getUrlforPeriodOf(days: Int) -> String {
        switch self {
        case .emailed:
            return "emailed/\(days)\(API.kApiKey)"
        case .shared:
            return "shared/\(days)\(API.kApiKey)"
        case .viewed:
            return "viewed/\(days)\(API.kApiKey)"
        default:
            return "Not URL"
        }
    }
    
    func getCategoryString() -> String {
        switch self {
        case .emailed:
            return VCTitle.kEmailed
        case .shared:
            return VCTitle.kShared
        case .viewed:
            return VCTitle.kViewed
        case .favorite:
            return VCTitle.kFavorites
        }
    }
}
