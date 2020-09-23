//
//  ReceipesHeaderView.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

class ReceipesHeaderView: UIView {
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "header"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Recipes"
        label.font = UIFont.boldSystemFont(ofSize: 33)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .clear
        self.setupViewLayout()
    }
    
    private func setupViewLayout() {
        addSubview(iconImageView)
        iconImageView.pinToSuperview(forAtrributes: [.top, .bottom])
        iconImageView.pinToSuperview(forAtrributes: [.leading], constant: 12)
        iconImageView.pin(attribute: .width, toView: iconImageView, toAttribute: .height, multiplier: 1.0, constant: 0.0)
        
        addSubview(titleLabel)
        titleLabel.pin(attribute: .leading, toView: iconImageView, toAttribute: .trailing, constant: 12)
        titleLabel.pin(attribute: .centerY, toView: iconImageView, toAttribute: .centerY)
    }
    
    
}
