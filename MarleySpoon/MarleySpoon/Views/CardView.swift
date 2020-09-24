//
//  CardView.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit
import Kingfisher

class CardView: UIView {
    
    
    // MARK: ViewModel
    private var viewModel: CardViewModel {
        didSet {
            self.titleLabel.text = viewModel.title
            self.backgroundImageView.kf.setImage(with: viewModel.backgroundImageURL,placeholder: UIImage(named: "logo") , options: [
                       .scaleFactor(UIScreen.main.scale),
                       .transition(.fade(1)),
                       .cacheOriginalImage,
                   ])
        }
    }
       
    // MARK: - View Hierarchy -
    
    private let shadowView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let containerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name:"Avenir Next",size:30)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 2
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let labelsBackGround: UIView = {
       let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.4953510123)
        return view
    }()
    
    private var leftConstraint:NSLayoutConstraint = NSLayoutConstraint()
    private var rightConstraint:NSLayoutConstraint = NSLayoutConstraint()
    private var topConstraint:NSLayoutConstraint = NSLayoutConstraint()
    private var bottomConstraint:NSLayoutConstraint = NSLayoutConstraint()
    
    
    // MARK: - Life Cycke -
    
    init(viewModel: CardViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup -
    
    func setUpViews() {
        backgroundColor = .clear
        setupViewLayout()
    }
    
    func setupViewLayout() {
        
        leftConstraint = NSLayoutConstraint(item: containerView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0)
        rightConstraint = NSLayoutConstraint(item: containerView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0)
        topConstraint = NSLayoutConstraint(item: containerView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0)
        bottomConstraint = NSLayoutConstraint(item: containerView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        addSubview(shadowView)
        addSubview(containerView)
        
        if viewModel.viewMode == .card {
            convertContainerViewToCardView()
        } else {
            convertContainerViewToFullScreen()
        }
        
        shadowView.pin(toView: containerView, attributes: [.left, .right, .top, .bottom])
        addConstraints([leftConstraint, rightConstraint, topConstraint, bottomConstraint])

        containerView.addSubview(backgroundImageView)
        backgroundImageView.pinEdgesToSuperview()
        
        containerView.addSubview(labelsBackGround)
        labelsBackGround.pinToSuperview(forAtrributes: [.leading, .trailing, .bottom])
        labelsBackGround.pinToSuperview(forAtrributes: [.height], multiplier: 0.3)
        
        containerView.addSubview(titleLabel)
        titleLabel.pinToSuperview(forAtrributes: [.leading], constant: 10)
        titleLabel.pinToSuperview(forAtrributes: [.trailing], constant: -10)
        titleLabel.pinToSuperview(forAtrributes: [.bottom], constant: -25.0)
        
    }
    
    /// Card configurations
    private func convertContainerViewToCardView() {
        updateLayout(for: .card)
        containerView.layer.cornerRadius = 20
        containerView.layer.masksToBounds = true
    }
    
    /// Full Screen Configurations
    private func convertContainerViewToFullScreen() {
        updateLayout(for: .full)
        containerView.layer.cornerRadius = 0
        containerView.layer.masksToBounds = true
    }

    private func updateLayout(for viewMode: CardViewMode) {
        switch viewMode {
        case .card:
            leftConstraint.constant = 20
            rightConstraint.constant = -20
            topConstraint.constant = 15
            bottomConstraint.constant = -15
            addShadow()
        case .full:
            leftConstraint.constant = 0
            rightConstraint.constant = 0
            topConstraint.constant = 0
            bottomConstraint.constant = 0
            removeShadow()
        }
    }

    
    private func addShadow() {
        shadowView.layer.cornerRadius = 20
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.2
        shadowView.layer.shadowRadius = 10
        shadowView.layer.shadowOffset = CGSize(width: -1, height: 2)
    }
    
    private func removeShadow() {
        shadowView.layer.shadowColor = UIColor.clear.cgColor
        shadowView.layer.shadowOpacity = 0
        shadowView.layer.shadowRadius = 0
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    func configure(with viewModel: CardViewModel) {
        self.viewModel = viewModel
    }
}


class CardViewModel {
    
    var viewMode: CardViewMode
    var title: String
    var backgroundImageURL: URL?
    
    init(title: String, backgroundImageURL: URL?, viewMode: CardViewMode = .card) {
        self.title = title
        self.backgroundImageURL = backgroundImageURL
        self.viewMode = viewMode
    }
    
}

enum CardViewMode {
    case full
    case card
}
