//
//  RecipesContract.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

protocol RecipesView: ViewInterface {
    func reloadData()
}

protocol RecipesPresentation: PresenterInterface {
    var numberOfSections: Int { get }
    func numberOrItems(in section: Int) -> Int
    func config(cell: RecipeItemView, at indexPath: IndexPath)
    func didSelectItem(at indexPath: IndexPath)
}

protocol RecipesInteraction: InteractorInterface {
    func getRecipes(_ completion: @escaping (Result<[Recipe], Error>) -> Void)
}

protocol RecipesWireframeInterface: WireframeInterface {
     func navigate(to option: RecipesWireframeNavigationOption)
}

enum RecipesWireframeNavigationOption {
    case detail(Recipe)
}

protocol RecipeItemView {
    func configView(with viewModel: RecipeViewModel)
}
