//
//  RequestProviderProtocol.swift
//  TopSwiftRepositories
//
//  Created by Thiago Cavalcante on 21/05/22.
//

import Foundation

protocol RequestProviderProtocol {
    var path: String { get set }
    var queryItems: [URLQueryItem] { get set }
}

extension RequestProviderProtocol {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com"
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}
