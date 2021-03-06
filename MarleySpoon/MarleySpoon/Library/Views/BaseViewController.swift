//
//  BaseViewController.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    lazy var activity: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.style = .large
        self.view.addSubview(activity)
        activity.pinToSuperview(forAtrributes: [.centerX, .centerY])
        return activity
    }()
    
}

extension BaseViewController: ViewInterface {
    func showLoader() {
        view.bringSubviewToFront(activity)
        activity.isHidden = false
        activity.startAnimating()
    }
    
    func hideLoader() {
        activity.isHidden = true
        activity.stopAnimating()
    }
}
