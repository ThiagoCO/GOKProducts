//
//  HomeView.swift
//  GOKProducts
//
//  Created by Thiago Cavalcante on 23/07/22.
//

import UIKit

protocol HomeProductsViewDelegate {
    func didSelectSpotlight(index: Int)
    func didSelectProduct(index: Int)
    func didSelectCash()
}

class HomeProductsView: UIView {
    
    var delegate: HomeProductsViewDelegate?
    var tableView: UITableView
    var titleLabel: UILabel
    var model: HomeProductsModel?
    
    override init(frame: CGRect) {
        tableView = UITableView(frame: .zero)
        titleLabel = UILabel()
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension HomeProductsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let model = model else { return UITableViewCell() }
        switch indexPath.row {
        case 0:
            let cell = HomeProductsSpotlightTableViewCell()
            cell.configure(spotlightModels: model.spotlight)
            cell.selectionStyle = .none
            cell.delegateSpotilight = self
            return cell
        case 1:
            let cell = HomeProductsCashTableViewCell()
            cell.configure(cashModel: model.cash)
            cell.selectionStyle = .none
            return cell
        default:
            let cell = HomeProductsTableViewCell()
            cell.configure(productModels: model.products)
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            delegate?.didSelectCash()
        }
    }
    
}

extension HomeProductsView: ViewCodable {
    
    func configure() {
        tableView.register(HomeProductsCashTableViewCell.self, forCellReuseIdentifier: "cashCell")
        tableView.register(HomeProductsSpotlightTableViewCell.self, forCellReuseIdentifier: "spotlightCell")
        tableView.register(HomeProductsTableViewCell.self, forCellReuseIdentifier: "productCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(tableView)
    }
    
    func buildConstraints() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -6),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0)
        ])
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: leftAnchor, constant: 6),
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    func render() {
        backgroundColor = .white
        tableView.separatorColor = .clear
        titleLabel.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .justified
        titleLabel.numberOfLines = 0
        titleLabel.text = "Olá, Maria"
    }
    
}

extension HomeProductsView: HomeProductsSpotlightCellDelegate {
    
    func didSelectSpotilight(index: Int) {
        delegate?.didSelectSpotlight(index: index)
    }
    
}

extension HomeProductsView: HomeProductsCellDelegate {
    
    func didSelectProduct(index: Int) {
        delegate?.didSelectProduct(index: index)
    }
    
}
