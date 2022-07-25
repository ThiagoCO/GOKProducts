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
}
