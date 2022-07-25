//
//  HomeProductsPresenterTestCase.swift
//  GOKProdutsTests
//
//  Created by Thiago Cavalcante on 25/07/22.
//

import Foundation

import XCTest
@testable import GOKProduts

class HomeProductsPresenterTestCase: XCTestCase {
    
    var sut: HomeProductsPresenter!
    var viewControllerFake: HomeProductsViewControllerFake!
    
    override func setUp() {
        super.setUp()
        viewControllerFake = HomeProductsViewControllerFake()
        sut = HomeProductsPresenter()
        sut.viewController = viewControllerFake
    }
    
    func testPresentLoading() {
        sut.presentScreenLoading()
        XCTAssertTrue(viewControllerFake.isDisplayLoadingCalled)
    }
    
    func testHideLoading() {
        sut.hideScreenLoading()
        XCTAssertFalse(viewControllerFake.isHideLoadingCalled)
    }
    
    func testPresentError() {
        sut.presentError(title: "", subtitle: "")
        XCTAssertTrue(viewControllerFake.isDisplayError)
    }
    
    func testPresentHome() {
        sut.presentProducts(homeModel: HomeProductsModel.dummy())
        XCTAssertTrue(viewControllerFake.isDisplayHome)
    }
    
    func testPresentDetail() {
        sut.presentDetails(detailsModel: HomeProductsDetailModel(cash: Cash(title: "", bannerURL: "", description: "")))
        XCTAssertTrue(viewControllerFake.isDisplayDetails)
    }
}
    
