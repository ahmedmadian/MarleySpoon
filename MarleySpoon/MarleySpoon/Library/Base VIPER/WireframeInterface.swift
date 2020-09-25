//
//  WireframeInterface.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

protocol WireframeInterface: class {
    func popFromNavigationController(animated: Bool)
    func dismiss(animated: Bool)

    func showErrorAlert(with message: String?)
    func showAlert(with title: String?, message: String?)
    func showAlert(with title: String?, message: String?, actions: [UIAlertAction])
}
