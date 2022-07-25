//
//  HomeProductsCashTableViewCell.swift
//  GOKProducts
//
//  Created by Thiago Cavalcante on 23/07/22.
//

import UIKit
import SDWebImage

class HomeProductsCashTableViewCell: UITableViewCell {

    var titleLabel: UILabel!
    var imageCash: UIImageView!
    
    func configure(cashModel: Cash) {
        setupView()
        imageCash.sd_setImage(with: URL(string: cashModel.bannerURL))
        titleLabel.text = cashModel.title
    }

}

extension HomeProductsCashTableViewCell: ViewCodable {
    
    func configure() {
        imageCash = UIImageView()
        titleLabel = UILabel()
    }
    
    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(imageCash)
    }
    
    func buildConstraints() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -6),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 6),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        
        imageCash.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageCash.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            imageCash.leftAnchor.constraint(equalTo: leftAnchor, constant: 6),
            imageCash.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            imageCash.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            imageCash.heightAnchor.constraint(equalToConstant: 125)
        ])
    }
    
    func render() {
        titleLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 24)
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .justified
        titleLabel.numberOfLines = 0
        
        imageCash.layer.masksToBounds = true
        imageCash.layer.cornerRadius = 5
        imageCash.layer.borderWidth = 0.5
        imageCash.layer.borderColor = UIColor.black.cgColor
    }
     
}
