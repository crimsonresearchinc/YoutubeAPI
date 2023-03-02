//
//  Filter+Comments.swift
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation

extension Filter {
    @frozen
    public enum Comments: URLQueryParameterable, Hashable, Sendable {
        case id(String)
        case parentId(String)

        public var queryItem: URLQueryItem {
            switch self {
            case .id(let id):
                return URLQueryItem(name: "id", value: id)
            case .parentId(let parentId):
                return URLQueryItem(name: "parentId", value: parentId)
            }
        }
    }
}
