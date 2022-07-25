//
//  HomeProductsViewControllerFake.swift
//  GOKProdutsTests
//
//  Created by Thiago Cavalcante on 25/07/22.
//

@testable import GOKProduts

class HomeProductsViewControllerFake: HomeProductsDisplayLogic {
    
    var isDisplayLoadingCalled = false
    var isHideLoadingCalled = false
    var isDisplayError = false
    var isDisplayHome = false
    var isDisplayDetails = false
    
    func displayScreenLoading() {
        isDisplayLoadingCalled = true
    }
    
    func hideScreenLoading() {
        isHideLoadingCalled = true
    }
    
    func displayError(title: String, subtitle: String) {
        isDisplayError = true
    }
    
    func displayHomeProducts(_ homeModel: HomeProductsModel) {
        isDisplayHome = true
    }
    
    func displayDetail(_ detailModel: HomeProductsDetailModel) {
        self.isDisplayDetails = true
    }
    
}
