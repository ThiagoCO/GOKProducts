//
//  HomeProductsCollectionViewCell.swift
//  GOKProducts
//
//  Created by Thiago Cavalcante on 23/07/22.
//

import UIKit

import UIKit
import SDWebImage

class HomeProductsCollectionViewCell: UICollectionViewCell {

    var imageProduct: UIImageView!
    
    func configure(product: Product) {
        setupView()
        imageProduct.sd_setImage(with: URL(string: product.imageURL))
    }

}

extension HomeProductsCollectionViewCell: ViewCodable {
    
    func configure() {
        imageProduct = UIImageView()
    }
    
    func buildHierarchy() {
        addSubview(imageProduct)
    }
    
    func buildConstraints() {
        
        imageProduct.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageProduct.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageProduct.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageProduct.heightAnchor.constraint(equalToConstant: 70),
            imageProduct.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func render() {
        backgroundColor = .white
        layer.masksToBounds = false
        layer.cornerRadius = 20
//        layer.borderWidth = 0.1
//        layer.borderColor = UIColor.black.cgColor
        
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = .zero
        layer.shadowRadius = 7
        layer.shadowPath = UIBezierPath(rect: layer.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
     
}
