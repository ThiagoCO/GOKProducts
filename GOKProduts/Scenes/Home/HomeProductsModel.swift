//
//  HomeModel.swift
//  GOKProducts
//
//  Created by Natasha Marques on 31/05/22.
//

import Foundation

struct HomeProductsModel: Decodable {
    var spotlight: [Spotlight]
    var products: [Product]
    var cash: Cash
}

struct Spotlight: Decodable {
    var name: String
    var bannerURL: String
    var description: String
}

struct Product: Decodable {
    var name: String
    var imageURL: String
    var description: String
}

struct Cash: Decodable {
    var title: String
    var bannerURL: String
    var description: String
}
