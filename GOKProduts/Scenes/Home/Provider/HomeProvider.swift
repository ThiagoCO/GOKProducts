//
//  HomeProvider.swift
//  GOKProducts
//
//  Created by Natasha Marques on 04/06/22.
//

import Foundation

class HomeProvider: RequestProviderProtocol {
    var path: String
    var queryItems: [URLQueryItem]
    
    init() {
        path = "/sandbox/products"
        queryItems = []
    }
}
