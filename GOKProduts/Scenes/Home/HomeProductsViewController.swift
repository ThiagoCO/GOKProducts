//
//  HomeProductsViewController.swift
//  GOKProducts
//
//  Created by Thiago Cavalcante on 23/07/22.
//

import UIKit

protocol HomeProductsDisplayLogic: AnyObject {
    func displayScreenLoading()
    func hideScreenLoading()
    func displayError(title: String, subtitle: String)
    func displayHomeProducts(_ homeModel: HomeProductsModel)
    func displayDetail(_ detailModel: HomeProductsDetailModel)
}

class HomeProductsViewController: UIViewController, BaseDisplayLogic {
    
    var theView: HomeProductsView?
    var interactor: HomeProductsBusinessLogic?
    var router: (NSObjectProtocol & HomeProductsRoutingLogic & HomeProductsDataPassing)?
    
    init(interactor: HomeProductsBusinessLogic = HomeProductsInteractor()) {
        super.init(nibName: nil, bundle: nil)
        self.interactor = interactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchProducts()
    }
    
    override func loadView() {
        super.loadView()
        theView = HomeProductsView()
        view = theView
        theView?.delegate = self
        setupInjection()
    }
    
    func setupInjection() {
        let viewController = self
        let presenter = HomeProductsPresenter()
        let router = HomeProductsRouter()
        viewController.router = router
        (interactor as? HomeProductsInteractor)?.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = (interactor as? HomeProductsInteractor)
    }
}

extension HomeProductsViewController: HomeProductsDisplayLogic {
    
    func displayDetail(_ detailModel: HomeProductsDetailModel) {
        router?.routeToSelected()
    }
    
    func displayHomeProducts(_ homeModel: HomeProductsModel) {
        theView?.model = homeModel
        theView?.update()
    }
    
    func displayScreenLoading() {
        theView?.tableView.alpha = 0
        showScreenLoading()
    }
    
    func hideScreenLoading() {
        theView?.tableView.alpha = 1
        removeLoadingState()
    }
    
    func displayError(title: String, subtitle: String) {
        showError(title: title, message: subtitle)
    }
    
}

extension HomeProductsViewController: HomeProductsViewDelegate {
    
    func didSelectSpotlight(index: Int) {
        interactor?.didSelectSpotlight(index: index)
    }
    
    func didSelectProduct(index: Int) {
        interactor?.didSelectProduct(index: index)
    }
    
    func didSelectCash() {
        interactor?.didSelectCash()
    }

}
