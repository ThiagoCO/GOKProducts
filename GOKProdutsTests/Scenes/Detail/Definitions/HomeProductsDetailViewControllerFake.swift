//
//  HomeProductsDetailViewControllerFake.swift
//  GOKProdutsTests
//
//  Created by Usertqi on 25/07/22.
//

@testable import GOKProduts

class HomeProductsDetailViewControllerFake: HomeProductsDetailDisplayLogic {
    
    var isDetailCalled = false

    func displayDetail(model: HomeProductsDetailModel) {
        isDetailCalled = true
    }

}

