//
//  HomeProductsDetailViewController.swift
//  GOKProduts
//
//  Created by Usertqi on 25/07/22.
//

import UIKit

protocol HomeProductsDetailDisplayLogic: AnyObject {
    func displayDetail(model: HomeProductsDetailModel)
}

class HomeProductsDetailViewController: UIViewController, BaseDisplayLogic {
    
    var theView: HomeProductsDetailView?
    var interactor: HomeProductsDetailBusinessLogic?
    var router: (NSObjectProtocol & HomeProductsDetailRoutingLogic & HomeProductsDetailDataPassing)?
    
    init(interactor: HomeProductsDetailBusinessLogic = HomeProductsDetailInteractor()) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        setupInjection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.showSelectedDetail()
    }
    
    override func loadView() {
        super.loadView()
        theView = HomeProductsDetailView()
        view = theView
    }
    
    func setupInjection() {
        let viewController = self
        let presenter = HomeProductsDetailPresenter()
        let router = HomeProductsDetailRouter()
        viewController.router = router
        (interactor as? HomeProductsDetailInteractor)?.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = (interactor as? HomeProductsDetailInteractor)
    }
}

extension HomeProductsDetailViewController: HomeProductsDetailDisplayLogic {
    
    func displayDetail(model: HomeProductsDetailModel) {
        theView?.update(model: model)
    }
    
}
