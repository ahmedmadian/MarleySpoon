//
//  RecipeDetailsViewModel.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

class RecipeDetailsViewModel {
    let title: String
    let imageURL: URL?
    let chefName: String
    var recipeDescription: String
    
    init(recipe: Recipe) {
        self.title = recipe.title ?? "Marley Spoon Recipe"
        self.imageURL = recipe.photo?.url
        self.chefName = recipe.chef?.name ?? "Marley Spoon Chef"
        self.recipeDescription = recipe.description ?? ""
    }
}
