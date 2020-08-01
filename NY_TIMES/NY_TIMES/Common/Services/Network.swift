//
//  Network.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 30.07.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit
import Alamofire
import JSONParsing

typealias NewsResponseBlock = ([News]?, Error?) -> Void

protocol NetworkProtocol {
    var baseUrl: String { get }
    init(baseUrl: String)
    func getData(endPoint: String, completion:@escaping (DefaultDataResponse?) -> Void)
}

class BaseNetwork: NetworkProtocol {
    var baseUrl: String
    
    required init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func getData(endPoint: String, completion:@escaping (DefaultDataResponse?) -> Void) {
        Alamofire.request(baseUrl+endPoint, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).response { response in
            completion(response)
        }
    }
}

final class Network: BaseNetwork {

    func getNewsBy(category: NewsCategory, period: Int, completion:@escaping NewsResponseBlock) {
        getData(endPoint: category.getUrlforPeriodOf(days: period)) { response in
            guard let data = response?.data else {
                completion(nil, response?.error)
                return
            }
            
            do {
                let json = try JSON(data: data)
                var tempArray = [News]()
                
                for elem in json["results"] {
                    let news = try News.parse(elem.1)
                    tempArray.append(news)
                }
                
                completion(tempArray, nil)
            }
            catch {
                completion(nil, response?.error)
            }
        }
    }

}
