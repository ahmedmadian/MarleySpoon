//
//  SceneDelegate.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.windowScene = windowScene
        
        let initialViewController = UINavigationController()
        initialViewController.setRootRoute(RecipesWireframe())
        
        window?.rootViewController = initialViewController
        
        window?.makeKeyAndVisible()
    }
    
}

