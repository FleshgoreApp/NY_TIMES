//
//  Constants.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit

struct VCTitle {
    static let kEmailed = "Emailed"
    static let kShared  = "Shared"
    static let kViewed  = "Viewed"
    static let kFavorites = "Favorites"
}

struct API {
    static let kUrlBaseString = "https://api.nytimes.com/svc/mostpopular/v2/"
    static let kApiKey = ".json?api-key=3ycKQJSP4SycGnZ6l3hQfupfSG8yb741"
}

struct AlertString {
    static let kOkTitle = "Ok"
    static let kError = "Error"
}

struct FontSize {
    static let kCellTitleFS:CGFloat = 17
    static let kCellNewsFS:CGFloat  = 15
}

struct Font {
    static let kCellTitle = UIFont.systemFont(ofSize: FontSize.kCellTitleFS)
    static let kCellNews  = UIFont.systemFont(ofSize: FontSize.kCellNewsFS)
}
