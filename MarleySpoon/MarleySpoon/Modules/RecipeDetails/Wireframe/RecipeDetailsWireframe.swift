//
//  RecipeDetailsWireframe.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

class RecipeDetailsWireframe: BaseWireframe {
    
    init(recipe: Recipe) {
        
        let moduleViewController = RecipeDetailsViewController()
        super.init(viewController: moduleViewController)
        
        let interactor = RecipeDetailsInteractor()
        
        let presenter = RecipeDetailsPresenter(view: moduleViewController, interactor: interactor, wireframe: self, recipe: recipe)
        
        moduleViewController.presenter = presenter
    }
    
}

extension RecipeDetailsWireframe: RecipeDetailsWireframeInterface {
    func navigate(to option: RecipeDetailsWireframeNavigationOption) {
    }
}
