//
//  RecipeViewModel.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

class RecipeViewModel {
   
    var title: String?
    var imageURL: URL?
    
    init(model: Recipe) {
        self.title = model.title
        self.imageURL = model.photo?.url
    }
}
