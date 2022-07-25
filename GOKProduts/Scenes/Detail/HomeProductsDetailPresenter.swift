//
//  HomeProductsDetailPresenter.swift
//  GOKProduts
//
//  Created by Usertqi on 25/07/22.
//

protocol HomeProductsdetailPresentationLogic {
    func presentDetail(model: HomeProductsDetailModel)
}

class HomeProductsDetailPresenter: HomeProductsdetailPresentationLogic {
    
    weak var viewController: HomeProductsDetailDisplayLogic?

    func presentDetail(model: HomeProductsDetailModel) {
        viewController?.displayDetail(model: model)
    }
    
}
