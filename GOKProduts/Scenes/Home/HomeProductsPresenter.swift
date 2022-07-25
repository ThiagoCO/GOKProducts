//
//  HomeProductsPresenter.swift
//  GOKProducts
//
//  Created by Thiago Cavalcante on 23/07/22.
//

import UIKit

protocol HomeProductsPresentationLogic {
    func presentScreenLoading()
    func hideScreenLoading()
    func presentError(title: String, subtitle: String)
    func presentProducts(homeModel: HomeProductsModel)
    func presentDetails(detailsModel: HomeProductsDetailModel)
}

class HomeProductsPresenter: HomeProductsPresentationLogic {
    
    weak var viewController: HomeProductsDisplayLogic?
    
    func presentScreenLoading() {
          viewController?.displayScreenLoading()
    }
    
    func hideScreenLoading() {
        DispatchQueue.main.asyncAfter(deadline: .now()+1) {
            self.viewController?.hideScreenLoading()
        }
    }
    
    func presentError(title: String, subtitle: String) {
        viewController?.displayError(title: title, subtitle: subtitle)
    }
    
    func presentProducts(homeModel: HomeProductsModel) {
        viewController?.displayHomeProducts(homeModel)
    }
    
    func presentDetails(detailsModel: HomeProductsDetailModel) {
        viewController?.displayDetail(detailsModel)
    }
    
}
