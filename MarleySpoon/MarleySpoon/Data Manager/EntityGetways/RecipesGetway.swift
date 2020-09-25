//
//  REcipesGetway.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/25/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

typealias FetchRecpiesEntityGatewayCompletionHandler = (_ movies: Result<[Recipe], Error>) -> Void

protocol RecipesGetway {
    func fetchRecipes(completion: @escaping FetchRecpiesEntityGatewayCompletionHandler)
}
