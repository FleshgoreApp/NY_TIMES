//
//  UIViewController+NoConnection.swift
//  NY_TIMES
//
//  Created by Saul Goodman on 02.08.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setNoConnection(_ visible: Bool) {
        let tag = 3529018
        var viewForRemove = self.view.viewWithTag(tag)
        viewForRemove?.removeFromSuperview()
        viewForRemove = nil
        
        if visible {
            let view = UIImageView()
            view.tag = tag
            view.image = UIImage(named: "noConnection")
            view.alpha = 0.08 //TODO image tintColor
            view.translatesAutoresizingMaskIntoConstraints = false
            
            self.view.addSubview(view)
            self.view.bringSubviewToFront(view)
            
            view.widthAnchor.constraint(equalToConstant: 200).isActive = true
            view.heightAnchor.constraint(equalToConstant: 200).isActive = true
            view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
            view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        }
    }
}
