//
//  Recipe.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Contentful

class Recipe: EntryDecodable, Resource, FieldKeysQueryable {
   
    static var contentTypeId: ContentTypeId = "recipe"

    var sys: Sys
    
    var title: String?
    var calories: Int?
    var description: String?
    var photo: Asset?
    var chef: Chef?
    var tags: [Tag]?

    required init(from decoder: Decoder) throws {
        sys = try decoder.sys()
        let fields = try decoder.contentfulFieldsContainer(keyedBy: FieldKeys.self)
        title = try fields.decode(String.self, forKey: .title)
        calories = try fields.decodeIfPresent(Int.self, forKey: .calories)
        description = try fields.decodeIfPresent(String.self, forKey: .description)
        try fields.resolveLink(forKey: .photo, decoder: decoder) { [weak self] asset in
            self?.photo = asset as? Asset
        }
        try fields.resolveLinksArray(forKey: .tags, decoder: decoder) { [weak self] array in
            self?.tags = array as? [Tag]
        }
        try fields.resolveLink(forKey: .chef, decoder: decoder, callback: { [weak self] chef in
            self?.chef = chef as? Chef
        })
    }

    enum FieldKeys: String, CodingKey {
        case title, photo, calories, description, chef, tags
    }
}
