//
//  HomeProductsInteractorTestCase.swift
//  GOKProdutsTests
//
//  Created by Thiago Cavalcante on 25/07/22.
//

import XCTest
@testable import GOKProduts

class HomeProductsInteractorTestCase: XCTestCase {
    
    var sut: HomeProductsInteractor!
    var workerFake: HomeProductsWorkerFake!
    var presenterFake: HomeProductsPresenterFake!
    
    override func setUp() {
        super.setUp()
        workerFake = HomeProductsWorkerFake()
        presenterFake = HomeProductsPresenterFake()
        sut = HomeProductsInteractor(worker: workerFake)
        sut.presenter = presenterFake
    }
    
    override func tearDown() {
        sut = nil
        workerFake = nil
        presenterFake = nil
        super.tearDown()
    }
    
    func testFetchProductsSuccess() {
        sut.fetchProducts()
        XCTAssertTrue(presenterFake.isLoadingCalled)
        XCTAssertTrue(presenterFake.isHideLoadingCalled)
        XCTAssertTrue(presenterFake.isSuccessCalled)
    }
    
    func testFetchProductsFailure() {
        workerFake.isFailure = true
        sut.fetchProducts()
        XCTAssertTrue(presenterFake.isLoadingCalled)
        XCTAssertTrue(presenterFake.isHideLoadingCalled)
        XCTAssertTrue(presenterFake.isErrorCalled)
    }
    
    func testDidSelectSpotlight() {
        sut.model = HomeProductsModel.dummy()
        sut.didSelectSpotlight(index: 0)
        XCTAssertEqual(presenterFake.detailModel?.title, "Recarga")
        XCTAssertEqual(presenterFake.detailModel?.imageURL, "https://s3-sa-east-1.amazonaws1.com/digio-exame/recharge_banner.png")
        XCTAssertEqual(presenterFake.detailModel?.description, "description")
    }
    
    func testDidSelectProduct() {
        sut.model = HomeProductsModel.dummy()
        sut.didSelectProduct(index: 0)
        XCTAssertEqual(presenterFake.detailModel?.title, "XBOX")
        XCTAssertEqual(presenterFake.detailModel?.imageURL, "https://s3-sa-east-1.amazonaws1.com/digio-exame/xbox_icon.png")
        XCTAssertEqual(presenterFake.detailModel?.description, "Description")
    }
    
    func testDidSelectCash() {
        sut.model = HomeProductsModel.dummy()
        sut.didSelectCash()
        XCTAssertEqual(presenterFake.detailModel?.title, "digio Cash")
        XCTAssertEqual(presenterFake.detailModel?.imageURL, "https://s3-sa-east-1.amazonaws1.com/digio-exame/cash_banner.png")
        XCTAssertEqual(presenterFake.detailModel?.description, "Description")
    }
    
}
