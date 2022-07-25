//
//  HomeProductsDetailPresenterFake.swift
//  GOKProdutsTests
//
//  Created by Usertqi on 25/07/22.
//

@testable import GOKProduts

class HomeProductsDetailPresenterFake: HomeProductsdetailPresentationLogic {
    
    var isDetailCalled = false
    
    func presentDetail(model: HomeProductsDetailModel) {
        isDetailCalled = true
    }

}
