//
//  Filter+VideoCategories.swift
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation

extension Filter {
    @frozen
    public enum VideoCategories: URLQueryParameterable, Hashable, Sendable {
        case id(String)
        case regionCode(String)

        public var queryItem: URLQueryItem {
            switch self {
            case .id(let id):
                return URLQueryItem(name: "id", value: id)
            case .regionCode(let code):
                return URLQueryItem(name: "regionCode", value: code)
            }
        }
    }
}
