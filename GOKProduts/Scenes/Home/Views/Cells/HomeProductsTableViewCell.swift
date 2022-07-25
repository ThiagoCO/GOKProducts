//
//  HomeProductsTableViewCell.swift
//  GOKProducts
//
//  Created by Thiago Cavalcante on 23/07/22.
//

import UIKit
import SDWebImage


protocol HomeProductsCellDelegate {
    func didSelectProduct(index: Int)
}

class HomeProductsTableViewCell: UITableViewCell {
    
    var delegate: HomeProductsCellDelegate?
    var collectionView: UICollectionView!
    var titleLabel: UILabel!
    
    var productModels: [Product] = []
    
    func configure(productModels: [Product]) {
        self.productModels = productModels
        setupView()
    }
    
}

extension HomeProductsTableViewCell: ViewCodable {
    
    func configure() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomeProductsCollectionViewCell.self, forCellWithReuseIdentifier: "productItem")
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 5)
        collectionView.delegate = self
        collectionView.dataSource = self
        
        titleLabel = UILabel()
    }
    
    func buildHierarchy() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(collectionView)
    }
    
    func buildConstraints() {
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -6),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 6),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            titleLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            collectionView.heightAnchor.constraint(equalToConstant: 145)
        ])
    }
    
    func render() {
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        
        titleLabel.text = "Produtos"
        titleLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 24)
        titleLabel.textColor = UIColor.black
        titleLabel.textAlignment = .justified
        titleLabel.numberOfLines = 0
    }
    
}

extension HomeProductsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productModels.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productItem", for: indexPath) as! HomeProductsCollectionViewCell
        cell.configure(product: productModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectProduct(index: indexPath.row)
    }
}


extension HomeProductsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 3, height: 125)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
