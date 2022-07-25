//
//  HomeProductsRouter.swift
//  GOKProduts
//
//  Created by Usertqi on 25/07/22.
//

import Foundation

@objc protocol HomeProductsRoutingLogic {
    func routeToSelected()
}

protocol HomeProductsDataPassing {
    var dataStore: HomeProductsDataStore? { get }
}

class HomeProductsRouter: NSObject, HomeProductsRoutingLogic, HomeProductsDataPassing {
    
    weak var viewController: HomeProductsViewController?
    var dataStore: HomeProductsDataStore?

    func routeToSelected() {
        let vc = HomeProductsDetailViewController()
        guard let destinationDataStore = vc.router?.dataStore else { return }
        var destinationDS = destinationDataStore
        passSpotlightDataToDetail(source: dataStore!, destination: &destinationDS)
        viewController?.present(vc, animated: true)
    }

    func passSpotlightDataToDetail(source: HomeProductsDataStore, destination: inout HomeProductsDetailDataStore) {
        destination.detailSelected = source.detailSelected
    }
    
}
