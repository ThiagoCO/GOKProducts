//
//  HomeProductsDetailModel+Dummy.swift
//  GOKProdutsTests
//
//  Created by Usertqi on 25/07/22.
//

@testable import GOKProduts

extension HomeProductsDetailModel {
    
    static func dummy() -> HomeProductsDetailModel {
        let model = HomeProductsModel.dummy()
        return HomeProductsDetailModel(spotlight: model.spotlight[0])
    }
}
