//
//  Data+GetImageData.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 01.08.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import Foundation

extension Data {
    static func getImageDataFrom(url: URL?) -> Data? {
        if let imageURL = url {
            do {
                return try Data(contentsOf: imageURL as URL)
            } catch {
                return nil
            }
        }
        return nil
    }
}
