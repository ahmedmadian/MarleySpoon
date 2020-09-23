//
//  ContentfulCredentials.swift
//  MarleySpoon
//
//  Created by Ahmed Madian on 9/23/20.
//  Copyright © 2020 Ahmed Madian. All rights reserved.
//

import Foundation

struct ContentfulCredentials {

    static let defaultDomainHost = "contentful.com"

    let spaceId: String
    let deliveryAPIAccessToken: String
    let domainHost: String

    static let `default`: ContentfulCredentials = {
        guard let bundleInfo = Bundle.main.infoDictionary else { fatalError() }

        let spaceId = bundleInfo["CONTENTFUL_SPACE_ID"] as! String
        let deliveryAPIAccessToken = bundleInfo["CONTENTFUL_DELIVERY_TOKEN"] as! String

        return ContentfulCredentials(
            spaceId: spaceId,
            deliveryAPIAccessToken: deliveryAPIAccessToken,
            domainHost: ContentfulCredentials.defaultDomainHost
        )
    }()
}
