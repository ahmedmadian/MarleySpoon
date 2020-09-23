//
//  RecipesInteractor.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

class RecipesInteractor {
    
    private let _recipeService: RecipesRemoteService
    
    init(recipeService: RecipesRemoteService) {
        self._recipeService = recipeService
    }
    
}

extension RecipesInteractor: RecipesInteraction {
    func getRecipes(_ completion: @escaping (Result<[Recipe], Error>) -> Void) {
        _recipeService.fetchRecipes { (result) in
            completion(result)
        }
    }
}
