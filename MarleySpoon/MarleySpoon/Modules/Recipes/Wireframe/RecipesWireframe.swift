//
//  RecipesWireframe.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

class RecipesWireframe: BaseWireframe {
    
    // MARK: - Module setup -
    
    init() {
        let moduleViewController = RecipesViewController()
        super.init(viewController: moduleViewController)
        
        let recipesGetway = RecipesRemoteGetway(client: ContentfulClientProvider(credentials: ContentfulCredentials.default).deliveryClient)
        
        let interactor = RecipesInteractor(recipesGetway: recipesGetway)
        
        let presenter = RecipesPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        
        moduleViewController.presenter = presenter
    }
}

// MARK: - Module Routering -

extension RecipesWireframe: RecipesWireframeInterface {
    func navigate(to option: RecipesWireframeNavigationOption) {
        switch option {
        case .detail(let recipe):
            let detailsWireframe = RecipeDetailsWireframe(recipe: recipe)
            self.viewController.present(wireframe: detailsWireframe, modalPresentationStyle: .automatic, animated: true)
        }
    }
}
