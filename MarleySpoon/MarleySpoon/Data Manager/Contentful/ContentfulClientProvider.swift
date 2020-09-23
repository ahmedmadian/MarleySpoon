//
//  ContentfulClientProvider.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

import Contentful

final class ContentfulClientProvider {

    let deliveryClient: Client

    init(credentials: ContentfulCredentials) {
        self.deliveryClient = Client(
            spaceId: credentials.spaceId,
            accessToken: credentials.deliveryAPIAccessToken,
            host: "cdn." + credentials.domainHost,
            contentTypeClasses: ContentfulClientProvider.contentTypeClasses
        )
    }

    private static var contentTypeClasses: [EntryDecodable.Type] = [
        Recipe.self,
        Tag.self,
        Chef.self
    ]
}
