//
//  HomeSpotlightTableViewCell.swift
//  GOKProducts
//
//  Created by Thiago Cavalcante on 23/07/22.
//

import UIKit
import SDWebImage

protocol HomeProductsSpotlightCellDelegate {
    func didSelectSpotilight(index: Int)
}

class HomeProductsSpotlightTableViewCell: UITableViewCell {
    
    var delegateSpotilight: HomeProductsSpotlightCellDelegate?
    var collectionView: UICollectionView!
    var spotlightModels: [Spotlight] = []
    
    func configure(spotlightModels: [Spotlight]) {
        self.spotlightModels = spotlightModels
        setupView()
    }
    
}

extension HomeProductsSpotlightTableViewCell: ViewCodable {
    
    func configure() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 20, height: 220)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HomeProductsSpotilightCollectionViewCell.self, forCellWithReuseIdentifier: "spotlightItem")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func buildHierarchy() {
        contentView.addSubview(collectionView)
    }
    
    func buildConstraints() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            collectionView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10),
            collectionView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func render() {
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
    }
    
}

extension HomeProductsSpotlightTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spotlightModels.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "spotlightItem", for: indexPath) as! HomeProductsSpotilightCollectionViewCell
        cell.configure(spotlight: spotlightModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegateSpotilight?.didSelectSpotilight(index: indexPath.row)
    }
}


extension HomeProductsSpotlightTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 20, height: 220)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
}
