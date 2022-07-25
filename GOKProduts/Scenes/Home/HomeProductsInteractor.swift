//
//  HomeProductsInteractor.swift
//  GOKProducts
//
//  Created by Thiago Cavalcante on 23/07/22.
//

import Foundation

protocol HomeProductsBusinessLogic {
    func fetchProducts()
}

class HomeProductsInteractor: HomeProductsBusinessLogic {
    
    internal var worker: HomeProductsNetworkLogic
    internal var presenter: HomeProductsPresentationLogic?
    
    internal init(worker: HomeProductsNetworkLogic = HomeProductsWorker()) {
        self.worker = worker
    }
    
    public func fetchProducts() {
        presenter?.presentScreenLoading()
        worker.searchProducts { (result: Result<HomeProductsModel, NetworkError>) in
            self.presenter?.hideScreenLoading()
            switch result {
            case .success(let model):
                self.presenter?.presentProducts(homeModel: model)
            case .failure(let failure):
                self.presenter?.presentError(title: "Oppps, tivemos um problema.", subtitle: "Tente novamente mais tarde.")
            }
        }
    }
    
}

