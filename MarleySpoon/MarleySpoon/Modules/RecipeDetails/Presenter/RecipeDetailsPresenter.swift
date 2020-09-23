//
//  RecipeDetailsPresenter.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

class RecipeDetailsPresenter {
    
    // MARK: - Private properties -

    private unowned var _view: RecipeDetailsView
    private var _interactor: RecipeDetailsInteractor
    private var _wireframe: RecipeDetailsWireframe
    private let _recipe: Recipe
    
    init(view: RecipeDetailsView, interactor: RecipeDetailsInteractor, wireframe: RecipeDetailsWireframe, recipe: Recipe) {
        self._view = view
        self._interactor = interactor
        self._wireframe = wireframe
        self._recipe = recipe
    }
}

extension RecipeDetailsPresenter: RecipeDetailsPresentation {
    
    func viewDidLoad() {
        let recipeDetailsViewModel = RecipeDetailsViewModel(recipe: _recipe)
        self._view.showDetails(with: recipeDetailsViewModel)
    }
    
    func numberOfTagItems(in section: Int) -> Int {
        return _recipe.tags?.count ?? 0
    }
    
    func config(tagCell: TagItemViewInterface, at indexPath: IndexPath) {
        let tagViewModel = TagViewModel(name: _recipe.tags?[indexPath.row].name)
        tagCell.configCell(with: tagViewModel)
    }
}
