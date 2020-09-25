//
//  ReceipesHeaderView.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

class ReceipesHeaderView: UIView {
    
    // MARK: - View Hierarchy -
    
    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 33)
        return label
    }()
    
    // MARK: - Life Cycle -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup -
    
    private func setupView() {
        self.backgroundColor = .clear
        self.setupViewLayout()
    }
    
    private func setupViewLayout() {
        addSubview(headerImageView)
        headerImageView.pinToSuperview(forAtrributes: [.top, .bottom])
        headerImageView.pinToSuperview(forAtrributes: [.leading], constant: 12)
        headerImageView.pin(attribute: .width, toView: headerImageView, toAttribute: .height, multiplier: 1.0, constant: 0.0)
        
        addSubview(headerTitleLabel)
        headerTitleLabel.pin(attribute: .leading, toView: headerImageView, toAttribute: .trailing, constant: 12)
        headerTitleLabel.pin(attribute: .centerY, toView: headerImageView, toAttribute: .centerY)
    }
    
    func config(with viewModel: ReceipesHeaderViewModel) {
        self.headerImageView.image = UIImage(named: viewModel.imageNamed)
        self.headerTitleLabel.text = viewModel.title
    }
    
}

// MARK: - ReceipesHeader ViewModel -

struct ReceipesHeaderViewModel {
    let imageNamed: String
    let title: String
}
