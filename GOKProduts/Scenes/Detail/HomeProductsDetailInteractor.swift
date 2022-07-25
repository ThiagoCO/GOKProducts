//
//  HomeProductsDetailsInteractor.swift
//  GOKProduts
//
//  Created by Usertqi on 25/07/22.
//

import Foundation


protocol HomeProductsDetailBusinessLogic {
    func showSelectedDetail()
}

protocol HomeProductsDetailDataStore {
    var detailSelected: HomeProductsDetailModel? { get set }
}

class HomeProductsDetailInteractor: HomeProductsDetailBusinessLogic,  HomeProductsDetailDataStore {
    
    var presenter: HomeProductsdetailPresentationLogic?
    
    var detailSelected: HomeProductsDetailModel?
    
    func showSelectedDetail() {
        guard let model = detailSelected else { return }
        presenter?.presentDetail(model: model)
    }
    
}
