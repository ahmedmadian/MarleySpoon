//
//  RecipesService.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Contentful

protocol RecipesRemoteService {
    func fetchRecipes(_ completion: @escaping (Result<[Recipe], Error>) -> Void)
}

class RecipesService {
    
    private let _client: Client
    
    init(client: Client) {
        self._client = client
    }
}

extension RecipesService: RecipesRemoteService {
    
    func fetchRecipes(_ completion: @escaping (Result<[Recipe], Error>) -> Void) {
        _client.fetchArray(of: Recipe.self) { (result: Result<HomogeneousArrayResponse<Recipe>, Error>) in
            switch result {
            case .success(let arrayResponse):
                let recipes = arrayResponse.items
                completion(.success(recipes))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
