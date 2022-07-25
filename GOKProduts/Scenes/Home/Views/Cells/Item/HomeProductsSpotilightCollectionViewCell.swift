//
//  HomeProductsSpotilightCollectionViewCell.swift
//  GOKProducts
//
//  Created by Thiago Cavalcante on 23/07/22.
//

import UIKit

import UIKit
import SDWebImage

class HomeProductsSpotilightCollectionViewCell: UICollectionViewCell {

    var imageSpotlight: UIImageView!
    
    func configure(spotlight: Spotlight) {
        setupView()
        imageSpotlight.sd_setImage(with: URL(string: spotlight.bannerURL))
    }

}

extension HomeProductsSpotilightCollectionViewCell: ViewCodable {
    
    func configure() {
        imageSpotlight = UIImageView()
    }
    
    func buildHierarchy() {
        addSubview(imageSpotlight)
    }
    
    func buildConstraints() {
        
        imageSpotlight.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageSpotlight.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            imageSpotlight.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            imageSpotlight.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageSpotlight.heightAnchor.constraint(equalToConstant: 200),
            imageSpotlight.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 20)
        ])
    }
    
    func render() {
        imageSpotlight.layer.masksToBounds = false
        imageSpotlight.layer.cornerRadius = 5
        
        imageSpotlight.layer.borderWidth = 0.1
        imageSpotlight.layer.borderColor = UIColor.black.cgColor
    }
     
}

