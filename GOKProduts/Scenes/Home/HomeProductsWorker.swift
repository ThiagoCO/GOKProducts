//
//  HomeService.swift
//  GOKProducts
//
//  Created by Thiago Cavalcante on 04/06/22.
//

import Foundation

protocol HomeProductsNetworkLogic {
    func searchProducts(completion: @escaping (Result<HomeProductsModel ,NetworkError>) -> Void)
}

class HomeProductsWorker: HomeProductsNetworkLogic {

    let networkProvider = NetworkProvider.shared
    
    func searchProducts(completion: @escaping (Result<HomeProductsModel ,NetworkError>) -> Void) {
        let requestProvider: HomeProvider = HomeProvider()
        return networkProvider.request(url: requestProvider.url) { (result: Result<HomeProductsModel, NetworkError>) in
            switch result {
            case .success(let model):
                completion(.success(model))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}


