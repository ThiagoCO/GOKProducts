//
//  HomeProductsDetailinteractorTestCase.swift
//  GOKProdutsTests
//
//  Created by Usertqi on 25/07/22.
//

import XCTest
@testable import GOKProduts

class HomeProductsDetailinteractorTestCase: XCTestCase {
    
    var sut: HomeProductsDetailInteractor!
    var presenterFake: HomeProductsDetailPresenterFake!
    
    override func setUp() {
        super.setUp()
        presenterFake = HomeProductsDetailPresenterFake()
        sut = HomeProductsDetailInteractor()
        sut.presenter = presenterFake
    }
    
    override func tearDown() {
        sut = nil
        presenterFake = nil
        super.tearDown()
    }
    
    func testShowDetails() {
        sut.detailSelected = HomeProductsDetailModel.dummy()
        sut.showSelectedDetail()
        XCTAssertTrue(presenterFake.isDetailCalled)
    }

}
