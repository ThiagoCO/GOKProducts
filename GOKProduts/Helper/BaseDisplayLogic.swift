//
//  BaseDisplayLogic.swift
//  GOKProducts
//
//  Created by Thiago Cavalcante on 23/07/22.
//

import UIKit

protocol BaseDisplayLogic {
    func showError(title: String?, message: String?)
    func showScreenLoading()
}

extension BaseDisplayLogic where Self: UIViewController {
    
    func showError(title: String?, message: String?) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        })
    }
    
    func showScreenLoading() {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: nil, message: "Carregando...", preferredStyle: .alert)
            let activityIndicator = LoadingView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            activityIndicator.backgroundColor = .clear
            alert.view.addSubview(activityIndicator)
            self?.present(alert, animated: true)
        }
    }
    
    func removeLoadingState() {
        DispatchQueue.main.async { [weak self] in
            if let vc = self?.presentedViewController, vc is UIAlertController {
                vc.dismiss(animated: true)
            }
        }
    }
    
}

