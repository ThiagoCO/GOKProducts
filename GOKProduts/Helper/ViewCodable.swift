//
//  ViewCodable.swift
//  GOKProducts
//
//  Created by Thiago Cavalcante on 23/07/22.
//

import Foundation

public protocol ViewCodable {
    func configure()
    func buildHierarchy()
    func buildConstraints()
    func render()
    func setupView()
}

public extension ViewCodable {
    
    func setupView() {
        configure()
        buildHierarchy()
        buildConstraints()
        render()
    }
    
    func configure() { }
    func render() { }
    
}
