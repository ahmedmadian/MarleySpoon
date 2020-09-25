//
//  RecipesInteractor.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

class RecipesInteractor {
    
    private let _recipesGetway: RecipesGetway
    
    init(recipesGetway: RecipesGetway) {
        self._recipesGetway = recipesGetway
    }
    
}

extension RecipesInteractor: RecipesInteraction {
    func getRecipes(_ completion: @escaping (Result<[Recipe], Error>) -> Void) {
        self._recipesGetway.fetchRecipes { (result) in
            completion(result)
        }
    }
}
