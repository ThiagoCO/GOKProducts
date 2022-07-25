//
//  HomeProductDetailPresenterTestCase.swift
//  GOKProdutsTests
//
//  Created by Usertqi on 25/07/22.
//

import XCTest
@testable import GOKProduts

class HomeProductsDetailPresenterTestCase: XCTestCase {
    
    var sut: HomeProductsDetailPresenter!
    var viewControllerFake: HomeProductsDetailViewControllerFake!
    
    override func setUp() {
        super.setUp()
        viewControllerFake = HomeProductsDetailViewControllerFake()
        sut = HomeProductsDetailPresenter()
        sut.viewController = viewControllerFake
    }
 
    func testPresentDetail() {
        sut.presentDetail(model: HomeProductsDetailModel.dummy())
        XCTAssertTrue(viewControllerFake.isDetailCalled)
    }
}
