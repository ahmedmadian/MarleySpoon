//
//  TagCell.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

class TagCell: UICollectionViewCell {
    
    // MARK: - Public properties -

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup -
    
    private func setupView() {
        backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        self.layer.cornerRadius = 5
        self.setupViewLayout()
    }
    
    private func setupViewLayout() {
        self.addSubview(titleLabel)
        self.titleLabel.pinToSuperview(forAtrributes: [.centerX])
        self.titleLabel.pinToSuperview(forAtrributes: [.bottom, .top])
    }
}

extension TagCell: TagItemViewInterface {
    func configCell(with viewModel: TagViewModel) {
        self.titleLabel.text = viewModel.name?.uppercased()
    }
}
