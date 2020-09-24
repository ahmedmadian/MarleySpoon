//
//  RecipesViewController.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import UIKit

class RecipesViewController: BaseViewController {
    
    // MARK: - Public properties -
    
    var presenter: RecipesPresentation!
    
     // MARK: - View Hierachy -
    
    private lazy var tableView: UITableView = {
        let tabelView = UITableView()
        tabelView.backgroundColor = .clear
        tabelView.separatorStyle = .none
        tabelView.showsVerticalScrollIndicator = false
        tabelView.rowHeight = 450.0
        tabelView.register(RecipeCell.self, forCellReuseIdentifier: String(describing: RecipeCell.self))
        tabelView.tableHeaderView = self.header
        tabelView.delegate = self
        tabelView.dataSource = self
        return tabelView
    }()
    
    private lazy var header: ReceipesHeaderView = {
        let view = ReceipesHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 80))
        return view
    }()
    
    // MARK: - View Controller Life Cycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.viewDidLoad()
        self.setupView()
    }
    
    // MARK: - View Setup -
    
    private func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.9210208058, green: 0.9372292161, blue: 0.945487082, alpha: 1)
        self.navigationController?.navigationBar.isHidden = true
        self.setupViewLayout()
    }
    
    private func setupViewLayout() {
        self.view.addSubview(tableView)
        tableView.pinEdgesToSuperview()
    }
    
}

// MARK: - Recipes View Output -

extension RecipesViewController: RecipesView {
    func configHeader(with viewModel: ReceipesHeaderViewModel) {
        self.header.config(with: viewModel)
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource -

extension RecipesViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.presenter.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOrItems(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: RecipeCell.self),
            for: indexPath) as? RecipeCell else {
                fatalError("Unresolved Error, Cann't load cell with identifier \(String(describing: RecipeCell.self))")
        }
        
        self.presenter.config(cell: cell, at: indexPath)
        
        return cell
    }
        
}

// MARK: - UICollectionViewDelegate -

extension RecipesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.didSelectItem(at: indexPath)
    }
}

