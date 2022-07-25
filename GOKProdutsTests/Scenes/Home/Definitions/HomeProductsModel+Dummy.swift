//
//  HomeProductsModel+Dummy.swift
//  DigioAppTests
//
//  Created by Thiago Cavalcante on 24/07/22.
//

@testable import GOKProduts

extension HomeProductsModel {

    static func dummy() -> HomeProductsModel {
        let spotlights = [
            Spotlight(
                name: "Recarga",
                bannerURL: "https://s3-sa-east-1.amazonaws1.com/digio-exame/recharge_banner.png",
                description: "description"
            ),
            Spotlight(
                name: "Uber",
                bannerURL: "https://s3-sa-east-1.amazonaws1.com/digio-exame/uber_banner.png",
                description: "description"
            )
        ]

        let products = [
            Product(
                name: "XBOX",
                imageURL: "https://s3-sa-east-1.amazonaws1.com/digio-exame/xbox_icon.png",
                description: "Description"
            ),
            Product(
                name: "Google Play",
                imageURL: "https://s3-sa-east-1.amazonaws1.com/digio-exame/google_play_icon.png",
                description: "Description"
            ),
            Product(
                name: "Level Up",
                imageURL: "https://s3-sa-east-1.amazonaws1.com/digio-exame/level_up_icon.png",
                description: "Description"
            )

        ]

        let cash = Cash(title: "digio Cash", bannerURL: "https://s3-sa-east-1.amazonaws1.com/digio-exame/cash_banner.png", description: "Description")

        return HomeProductsModel(spotlight: spotlights, products: products, cash: cash)
    }
}
