//
//  Date+CurrentTimeMillis.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 01.08.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import Foundation

extension Date {
    static func currentTimeMillis() -> Double {
        let nowDouble = NSDate().timeIntervalSince1970
        return Double(nowDouble*1000).rounded()
    }
}
