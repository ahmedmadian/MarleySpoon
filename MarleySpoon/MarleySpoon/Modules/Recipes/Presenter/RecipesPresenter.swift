//
//  RecipesPresenter.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

class RecipesPresenter {
    
    // MARK: - Private properties -
    
    private unowned var _view: RecipesView
    private var _interactor: RecipesInteraction
    private var _wireframe: RecipesWireframeInterface
    private var _items: [Recipe]
    
    init(view: RecipesView, interactor: RecipesInteraction, wireframe: RecipesWireframeInterface) {
        self._view = view
        self._interactor = interactor
        self._wireframe = wireframe
        self._items = []
    }
}


// MARK: - RecipesPresentation -

extension RecipesPresenter: RecipesPresentation {
    
    var numberOfSections: Int {
        return 1
    }
    
    func viewDidLoad() {
        self._view.configHeader(with: ReceipesHeaderViewModel(imageNamed: "header", title: "Recipes"))
        self._view.showLoader()
        _interactor.getRecipes { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let recipes):
                    self?._items = recipes
                    self?._view.reloadData()
                case .failure(let error):
                    self?._wireframe.showErrorAlert(with: error.localizedDescription)
                }
                self?._view.hideLoader()
            }
        }
    }
    
    func numberOrItems(in section: Int) -> Int {
        return _items.count
    }
    
    func config(cell: RecipeItemView, at indexPath: IndexPath) {
        let recipeViewModel = RecipeViewModel(model: _items[indexPath.row])
        cell.configView(with: recipeViewModel)
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let selectedItem = _items[indexPath.row]
        self._wireframe.navigate(to: .detail(selectedItem))
    }
}
