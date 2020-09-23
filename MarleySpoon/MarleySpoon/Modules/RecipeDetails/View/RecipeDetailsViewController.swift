//
//  RecipeDetailsViewController.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

class RecipeDetailsViewController: BaseViewController {
    
    // MARK: - Public properties -
    
    var presenter: RecipeDetailsPresentation!
    
    // MARK: - View Hierachy -
    
    private let scrollView = UIScrollView()
    
    private let cardView = CardView(viewModel: CardViewModel(title: "", backgroundImageURL:nil, viewMode: .full))

    private lazy var tagsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(TagCell.self, forCellWithReuseIdentifier: String(describing: TagCell.self))
        collectionView.dataSource = self
        return collectionView
    }()
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let width = (self.view.frame.width) / 3.5
        layout.itemSize = CGSize(width: width, height: 30)
        return layout
    }()
    
    private let chefIconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "chef"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let chefNameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "close-darkOnLight")!, for: .normal)
        button.addTarget(self, action: #selector(close), for: .touchUpInside)
        return button
    }()
    
    // MARK: - View Controller Life Cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.presenter.viewDidLoad()
    }
    
    // MARK: - View Setup -
    
    private func setupView() {
        view.backgroundColor = .white
        self.setupViewLayout()
    }
    
    private func setupViewLayout() {

           /// ScrollView Layout
           view.addSubview(scrollView)
           scrollView.pinEdgesToSuperview()
           
           /// Card View Constraints
           scrollView.addSubview(cardView)
           cardView.pinToSuperview(forAtrributes: [.centerX, .top], multiplier: 1.0, constant: 0.0)
           cardView.pin(attribute: .height, toView: nil, toAttribute: .notAnAttribute, multiplier: 1.0, constant: 450)
           cardView.pin(attribute: .width, toView: nil, toAttribute: .notAnAttribute, multiplier: 1.0, constant: UIScreen.main.bounds.size.width)
           
           /// collection view
           scrollView.addSubview(tagsCollectionView)
           tagsCollectionView.pinToSuperview(forAtrributes: [.leading, .trailing], constant: 20)
           tagsCollectionView.pin(attribute: .top, toView: cardView, toAttribute: .bottom, constant: 8)
           tagsCollectionView.pin(attribute: .height, toView: nil, toAttribute: .notAnAttribute, constant: 35)

           /// close button
           view.addSubview(closeButton)
           closeButton.pin(toView: cardView, attributes: [.trailing], multiplier: 1.0, constant: -20)
           closeButton.pin(toView: cardView, attributes: [.top], multiplier: 1.0, constant: 20)
           closeButton.pin(attribute: .width, toView: nil, toAttribute: .notAnAttribute, multiplier: 1.0, constant: 30)
           closeButton.pin(attribute: .height, toView: nil, toAttribute: .notAnAttribute, multiplier: 1.0, constant: 30)
           
           
           /// Chef iCon
           scrollView.addSubview(chefIconImageView)
           chefIconImageView.pinToSuperview(forAtrributes: [.leading], constant: 20)
           chefIconImageView.pin(attribute: .height, toView: nil, toAttribute: .notAnAttribute, constant: 20)
           chefIconImageView.pin(attribute: .width, toView: chefIconImageView, toAttribute: .height)
           chefIconImageView.pin(attribute: .top, toView: tagsCollectionView, toAttribute: .bottom, constant: 12)
           
           /// chef name Label
           scrollView.addSubview(chefNameLabel)
           chefNameLabel.pin(attribute: .leading, toView: chefIconImageView, toAttribute: .trailing, multiplier: 1.0, constant: 12)
           chefNameLabel.pinToSuperview(forAtrributes: [.trailing])
           chefNameLabel.pin(attribute: .centerY, toView: chefIconImageView, toAttribute: .centerY, multiplier: 1.0, constant: 0.0)
           
           /// Description Label
           scrollView.addSubview(descriptionLabel)
           descriptionLabel.pinToSuperview(forAtrributes: [.leading, .trailing], constant: 20)
           let centerX =  NSLayoutConstraint(item: descriptionLabel, attribute: .centerX, relatedBy: .equal, toItem: scrollView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
           let top =  NSLayoutConstraint(item: descriptionLabel, attribute: .top, relatedBy: .equal, toItem: chefIconImageView, attribute: .bottom, multiplier: 1.0, constant: 40)

           scrollView.translatesAutoresizingMaskIntoConstraints = false
           scrollView.addConstraints([centerX, top])
           scrollView.pin(toView: descriptionLabel, attributes: [.bottom], multiplier: 1.0, constant: 0.0)
       }
    
    private func formatDescrption(text: String) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3
        
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20, weight: .regular),
            NSAttributedString.Key.foregroundColor: UIColor.gray,
            NSAttributedString.Key.paragraphStyle : paragraphStyle
        ]
        
        let attributedString = NSAttributedString(string: text, attributes: attributes)
        
        return attributedString
        
    }
    
    // MARK: - Actions -
    
    @objc private func close() {
      dismiss(animated: true, completion: nil)
    }
}

// MARK: - View Output -

extension RecipeDetailsViewController: RecipeDetailsView {
    func showDetails(with recipe: RecipeDetailsViewModel) {
        let cardViewModel = CardViewModel(title: recipe.title, backgroundImageURL: recipe.imageURL)
        self.cardView.configure(with: cardViewModel)
        self.chefNameLabel.text = recipe.chefName
        self.descriptionLabel.attributedText = self.formatDescrption(text: recipe.recipeDescription)
    }
}

// MARK: - Collection View Data Source -

extension RecipeDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.numberOfTagItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TagCell.self), for: indexPath) as? TagCell else {
            fatalError("Unresolved Error, unable to load cell with identifier \(String(describing: TagCell.self))")
        }
        
        self.presenter.config(tagCell: cell, at: indexPath)
        
        return cell
    }
}
