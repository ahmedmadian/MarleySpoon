//
//  Tag.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Contentful

class Tag: EntryDecodable, Resource, FieldKeysQueryable {
   
    static var contentTypeId: ContentTypeId = "tag"
    
    var sys: Sys
    var name: String?
    
    required init(from decoder: Decoder) throws {
        sys = try decoder.sys()
        let fields = try decoder.contentfulFieldsContainer(keyedBy: FieldKeys.self)
        name = try fields.decode(String.self, forKey: .name)
    }
    
    enum FieldKeys: String, CodingKey {
        case name
    }
}
