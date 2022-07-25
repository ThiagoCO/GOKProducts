//
//  HomeProductsDetails.swift
//  GOKProduts
//
//  Created by Usertqi on 25/07/22.
//

import UIKit

protocol DetailDisplayLogic {
    func displaySelectedSpotlight(_ selectedItem: Spotlight?)
    func displaySelectedCash(_ selectedItem: Cash?)
    func displaySelectedProduct(_ selectedItem: Product?)
    func displayEmptyState()
}

class HomeProductsDetailView: UIView {
    
    var contentView: UIView
    var headerContentView: UIView
    var headerLabel: UILabel
    var separatorView: UIView
    var lblDescription: UILabel
    var imageContent: UIImageView
    
    let kScreenWidth = UIScreen.main.bounds.width
    let kScreenHeight = UIScreen.main.bounds.height
    let kHeaderContentMargin: CGFloat = 40
    let kHeaderLabelMargin: CGFloat = 16
    
    override init(frame: CGRect) {
        contentView = UIView()
        headerContentView = UIView()
        headerLabel = UILabel()
        separatorView = UIView()
        lblDescription = UILabel()
        imageContent = UIImageView()
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(model: HomeProductsDetailModel) {
        headerLabel.text = model.title
        lblDescription.text = model.description
        imageContent.sd_setImage(with: URL(string: model.imageURL), completed: nil)
    }
    
}

extension HomeProductsDetailView: ViewCodable {
    
    func buildHierarchy() {
        addSubview(contentView)
        contentView.addSubview(headerContentView)
        headerContentView.addSubview(headerLabel)
        headerContentView.addSubview(separatorView)
        contentView.addSubview(lblDescription)
        contentView.addSubview(imageContent)
    }
    
    func buildConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            contentView.bottomAnchor.constraint(equalTo: imageContent.topAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            headerContentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            headerContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            headerContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            headerContentView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: headerContentView.topAnchor, constant: 0),
            headerLabel.leadingAnchor.constraint(equalTo: headerContentView.leadingAnchor, constant: kHeaderLabelMargin),
            headerLabel.trailingAnchor.constraint(equalTo: headerContentView.trailingAnchor, constant: kHeaderLabelMargin),
            headerLabel.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 0),
            separatorView.leadingAnchor.constraint(equalTo: headerContentView.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: headerContentView.trailingAnchor),
            separatorView.bottomAnchor.constraint(equalTo: headerContentView.bottomAnchor, constant: 0),
            separatorView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            lblDescription.topAnchor.constraint(equalTo: headerContentView.bottomAnchor, constant: kHeaderContentMargin),
            lblDescription.leadingAnchor.constraint(equalTo: headerContentView.leadingAnchor, constant: kHeaderContentMargin),
            lblDescription.trailingAnchor.constraint(equalTo: headerContentView.trailingAnchor, constant: -kHeaderContentMargin),
            lblDescription.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -kHeaderContentMargin)
        ])
        
        NSLayoutConstraint.activate([
            imageContent.widthAnchor.constraint(equalToConstant: kScreenWidth),
            imageContent.heightAnchor.constraint(equalToConstant: kScreenHeight / 3),
            imageContent.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    func render() {
        
        backgroundColor = .secondarySystemBackground
        
        contentView.alpha = 1
        contentView.backgroundColor = .secondarySystemBackground
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        headerContentView.translatesAutoresizingMaskIntoConstraints = false
        
        headerLabel.text = "Loading..."
        headerLabel.font = UIFont(name: "Avenir Next", size: 26)
        headerLabel.textColor = .black
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        separatorView.backgroundColor = UIColor.lightGray
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        lblDescription.font = UIFont(name: "Avenir Next", size: 20)
        lblDescription.font = .boldSystemFont(ofSize: 20)
        lblDescription.textAlignment = .center
        lblDescription.textColor = UIColor.black
        lblDescription.numberOfLines = 0
        lblDescription.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        lblDescription.translatesAutoresizingMaskIntoConstraints = false
        
        imageContent.layer.masksToBounds = false
        imageContent.layer.cornerRadius = 40
        imageContent.contentMode = .scaleAspectFit
        imageContent.clipsToBounds = true
        imageContent.translatesAutoresizingMaskIntoConstraints = false
    }
    
}
