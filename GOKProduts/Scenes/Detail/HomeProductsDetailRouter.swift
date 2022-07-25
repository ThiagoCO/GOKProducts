//
//  HomeProductsDetailRouter.swift
//  GOKProduts
//
//  Created by Usertqi on 25/07/22.
//

import Foundation

import UIKit

@objc protocol HomeProductsDetailRoutingLogic {
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol HomeProductsDetailDataPassing {
    var dataStore: HomeProductsDetailDataStore? { get }
}

class HomeProductsDetailRouter: NSObject, HomeProductsDetailRoutingLogic, HomeProductsDetailDataPassing {
    weak var viewController: HomeProductsDetailViewController?
    var dataStore: HomeProductsDetailDataStore?

}
