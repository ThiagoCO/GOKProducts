//
//  HomeProductsWorkerFake.swift
//  GOKProdutsTests
//
//  Created by Thiago Cavalcante on 25/07/22.
//

@testable import GOKProduts

class HomeProductsWorkerFake: HomeProductsNetworkLogic {
    
    var isFailure: Bool
    
    init(isFailure: Bool = false) {
        self.isFailure = isFailure
    }
    
    func searchProducts(completion: @escaping (Result<HomeProductsModel, NetworkError>) -> Void) {
        if !isFailure {
            completion(.success(HomeProductsModel.dummy()))
        } else {
            completion(.failure(NetworkError.notFound))
        }
    }
    
}


