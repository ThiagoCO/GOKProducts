//
//  HomeProductsPresenterFake.swift
//  GOKProdutsTests
//
//  Created by Thiago Cavalcante on 25/07/22.
//

@testable import GOKProduts

class HomeProductsPresenterFake: HomeProductsPresentationLogic {
    
    var isLoadingCalled = false
    var isHideLoadingCalled = false
    var isErrorCalled = false
    var isSuccessCalled = false
    var isDetailCalled = false
    
    var detailModel: HomeProductsDetailModel?
    
    func presentScreenLoading() {
        isLoadingCalled = true
    }
    
    func hideScreenLoading() {
        isHideLoadingCalled = true
    }
    
    func presentError(title: String, subtitle: String) {
        isErrorCalled = true
    }
    
    func presentProducts(homeModel: HomeProductsModel) {
        isSuccessCalled = true
    }
    
    func presentDetails(detailsModel: HomeProductsDetailModel) {
        isDetailCalled = true
        self.detailModel = detailsModel
    }
    
}
