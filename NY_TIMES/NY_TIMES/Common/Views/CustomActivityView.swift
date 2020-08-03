//
//  CustomActivityView.swift
//  Quotes
//
//  Created by Saul Goodman on 09.03.2020.
//  Copyright © 2020 Shvets. All rights reserved.
//

import UIKit

class CustomActivityIndicatorView: UIView {
    private var activityIndicator = UIActivityIndicatorView()
    private var _layer = UIView()
    private weak var view: UIView?
    
    init(parentView: UIView) {
        super.init(frame: CGRect.zero)
        self.view = parentView
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        if let view = self.view {
            let layer = UIView()
            layer.backgroundColor = UIColor.clear //UIColor.black
            layer.alpha = 0.6
            layer.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(layer)
            view.bringSubviewToFront(layer)
            layer.stretchToFitThe(parentView: view)
            
            var AI: UIActivityIndicatorView!
            if #available(iOS 13, *) {
                AI = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
            } else {
                AI = UIActivityIndicatorView()
            }
            
            AI.color = UIColor.lightGray //UIColor.white
            AI.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(AI)
            AI.centerYAnchor.constraint(equalTo: layer.centerYAnchor).isActive = true
            AI.centerXAnchor.constraint(equalTo: layer.centerXAnchor).isActive = true
            
            AI.startAnimating()
            
            activityIndicator = AI
            _layer = layer
            activityIndicator.isHidden = true
            _layer.isHidden = true
        }
    }
    
    func showActivityIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.activityIndicator.isHidden = false
            self.activityIndicator.alpha = 1
            self._layer.isHidden = false
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.activityIndicator.isHidden = true
            self.activityIndicator.alpha = 0
            self._layer.isHidden = true
        }
    }
}
