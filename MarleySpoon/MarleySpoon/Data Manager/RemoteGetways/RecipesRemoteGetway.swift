//
//  RecipesRemoteGetway.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Contentful

class RecipesRemoteGetway {
    
    private let _client: Client
    
    init(client: Client) {
        self._client = client
    }
}

extension RecipesRemoteGetway: RecipesGetway {
    
    func fetchRecipes(completion: @escaping FetchRecpiesEntityGatewayCompletionHandler) {
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
