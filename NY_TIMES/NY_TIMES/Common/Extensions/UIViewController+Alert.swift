//
//  UIViewController+Alert.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 31.07.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit

typealias SimpleCallBack = () -> ()

//Alerts
extension UIViewController {
    func showAlertWithOkButton(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: AlertString.kOkTitle, style: .default, handler: nil)
        alert.addAction(okAction)
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func showAlertWith(title: String?, message: String?, defaultBtnTitle: String?, destructiveBtnTitle: String?, defaultBtnHandler: SimpleCallBack?, destructiveBtnHandler: SimpleCallBack?) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let defaultTitle = defaultBtnTitle {
            let defaultButtonAction = UIAlertAction(title: defaultTitle, style: .default) { _ in
                if let handler = defaultBtnHandler {
                    handler()
                }
            }
            alert.addAction(defaultButtonAction)
        }
        
        if let destructiveTitle = destructiveBtnTitle {
            let destructiveButtonAction = UIAlertAction(title: destructiveTitle, style: .destructive) { _ in
                if let handler = destructiveBtnHandler {
                    handler()
                }
            }
            alert.addAction(destructiveButtonAction)
        }
        
        self.present(alert, animated: true, completion: nil)
    }
}
