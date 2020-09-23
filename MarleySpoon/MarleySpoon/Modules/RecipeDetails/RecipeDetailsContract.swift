//
//  RecipeDetailsContract.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

protocol RecipeDetailsView: ViewInterface {
    func showDetails(with recipe: RecipeDetailsViewModel)
}

protocol RecipeDetailsPresentation: PresenterInterface {
    func numberOfTagItems(in section: Int) -> Int
    func config(tagCell: TagItemViewInterface, at indexPath: IndexPath)
}

protocol RecipeDetailsInteraction: InteractorInterface {
}

protocol RecipeDetailsWireframeInterface: WireframeInterface {
    func navigate(to option: RecipeDetailsWireframeNavigationOption)
}

enum RecipeDetailsWireframeNavigationOption {
}

protocol TagItemViewInterface {
    func configCell(with viewModel: TagViewModel)
}
