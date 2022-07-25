//
//  HomeProductsViewTestCase.swift
//  GOKProductsTests
//
//  Created by Thiago Cavalcante on 24/07/22.
//

@testable import GOKProduts
import FBSnapshotTestCase

class HomeProductsViewControllerTestCase: FBSnapshotTestCase {

    var sut: HomeProductsViewController!

    override func setUp() {
        super.setUp()

        //recordMode = true
        sut = HomeProductsViewController(interactor: HomeProductsInteractorFake())
        sut.view.translatesAutoresizingMaskIntoConstraints = false
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        window.rootViewController = sut
        sut.viewDidLoad()
        sut.displayHomeProducts(HomeProductsModel.dummy())
        
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testSnapshot() {
        FBSnapshotVerifyView(sut.view, identifier: "home-screen", overallTolerance: 0.1)
    }

}
