//
//  HomeProductsDetailViewControllerTestCase.swift
//  GOKProdutsTests
//
//  Created by Usertqi on 25/07/22.
//

@testable import GOKProduts
import FBSnapshotTestCase

class HomeProductsDetailViewControllerTestCase: FBSnapshotTestCase {

    var sut: HomeProductsDetailViewController!

    override func setUp() {
        super.setUp()

        //recordMode = true
        sut = HomeProductsDetailViewController(interactor: HomeProductsDetailInteractorFake())
        sut.view.translatesAutoresizingMaskIntoConstraints = false
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.rootViewController = sut
        sut.viewDidLoad()
        sut.displayDetail(model: HomeProductsDetailModel.dummy())
        
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSnapshot() {
        FBSnapshotVerifyView(sut.view, identifier: "detail-screen", overallTolerance: 0.1)
    }

}
