//
//  CardViewModel.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

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
