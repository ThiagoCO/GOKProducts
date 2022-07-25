//
//  HomeProductsDetailModel.swift
//  GOKProduts
//
//  Created by Usertqi on 25/07/22.
//

import Foundation

class HomeProductsDetailModel {
    
    var title: String
    var description: String
    var imageURL: String
    
    init(spotlight: Spotlight) {
        self.title = spotlight.name
        self.description = spotlight.description
        self.imageURL = spotlight.bannerURL
    }
    
    init(product: Product) {
        self.title = product.name
        self.description = product.description
        self.imageURL = product.imageURL
    }
    
    init(cash: Cash) {
        self.title = cash.title
        self.description = cash.description
        self.imageURL = cash.bannerURL
    }
    
}
