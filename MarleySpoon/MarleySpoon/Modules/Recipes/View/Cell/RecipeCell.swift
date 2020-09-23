//
//  RecipeCell.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    
     // MARK: - Public properties -
    
    private let cardView = CardView(viewModel:CardViewModel(title: "", backgroundImageURL: nil, viewMode: .card))
     
    // MARK: - Life Cycle -
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup -
        
    private func setupView() {
        backgroundColor = .clear
        selectionStyle = .none
        self.setupViewLayout()
    }
    
    private func setupViewLayout() {
        addSubview(cardView)
        cardView.pinEdgesToSuperview()
        self.animateCell()
    }
    
    private func animateCell() {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        self.layer.transform = rotationTransform
        self.alpha = 0.5
        UIView.animate(withDuration: 1.0) {
            self.layer.transform = CATransform3DIdentity
            self.alpha = 1.0
        }
    }
}

extension RecipeCell: RecipeItemView {
    func configView(with viewModel: RecipeViewModel) {
        let cardViewModel = CardViewModel(title: viewModel.title ?? "", backgroundImageURL: viewModel.imageURL )
        self.cardView.configure(with: cardViewModel)
    }
}
