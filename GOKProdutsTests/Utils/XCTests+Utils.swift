//
//  XCTests+Utils.swift
//  DigioAppTests
//
//  Created by Thiago Cavalcante on 24/07/22.
//

import XCTest

extension XCTestCase {
    func getCurrentImageScreen() -> UIImageView {
        let image = XCUIScreen.main.screenshot().image
        let imageView = UIImageView(image: image.removeStatusBar())
        return imageView
    }
}
