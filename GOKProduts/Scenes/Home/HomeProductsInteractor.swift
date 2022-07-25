//
//  HomeProductsInteractor.swift
//  GOKProducts
//
//  Created by Thiago Cavalcante on 23/07/22.
//

import Foundation

protocol HomeProductsBusinessLogic {
    func fetchProducts()
    func didSelectSpotlight(index: Int)
    func didSelectProduct(index: Int)
    func didSelectCash()
}

protocol HomeProductsDataStore {
    var detailSelected: HomeProductsDetailModel? { get set }
}

class HomeProductsInteractor: HomeProductsBusinessLogic, HomeProductsDataStore {
    
    var worker: HomeProductsNetworkLogic
    var presenter: HomeProductsPresentationLogic?
    var model: HomeProductsModel?
    var detailSelected: HomeProductsDetailModel?
    
    init(worker: HomeProductsNetworkLogic = HomeProductsWorker()) {
        self.worker = worker
    }
    
    public func fetchProducts() {
        presenter?.presentScreenLoading()
        worker.searchProducts { (result: Result<HomeProductsModel, NetworkError>) in
            self.presenter?.hideScreenLoading()
            switch result {
            case .success(let model):
                self.model = model
                self.presenter?.presentProducts(homeModel: model)
            case .failure(let failure):
                self.presenter?.presentError(title: "Oppps, tivemos um problema.", subtitle: "Tente novamente mais tarde.")
            }
        }
    }
    
    func didSelectSpotlight(index: Int) {
        guard let spotlight = model?.spotlight[index] else { return }
        let detailModel = HomeProductsDetailModel(spotlight: spotlight)
        detailSelected = detailModel
        presenter?.presentDetails(detailsModel: detailModel)
    }
    
    func didSelectProduct(index: Int) {
        guard let product = model?.products[index] else { return }
        let detailModel = HomeProductsDetailModel(product: product)
        detailSelected = detailModel
        presenter?.presentDetails(detailsModel: detailModel)
    }
    
    func didSelectCash() {
        guard let cash = model?.cash else { return }
        let detailModel = HomeProductsDetailModel(cash: cash)
        detailSelected = detailModel
        presenter?.presentDetails(detailsModel: detailModel)
    }
    
}

