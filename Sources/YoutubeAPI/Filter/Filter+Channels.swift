//
//  Filter+Channels.swift
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation

extension Filter {
    @frozen
    public enum Channels: URLQueryParameterable, Hashable, Sendable {
        case categoryId(String)
        case username(String)
        case id(String)
        case managedByMe(Bool)
        case mine(Bool)

        public var queryItem: URLQueryItem {
            switch self {
            case .categoryId(let categoryId):
                return URLQueryItem(name: "categoryId", value: categoryId)
            case .username(let username):
                return URLQueryItem(name: "forUsername", value: username)
            case .id(let id):
                return URLQueryItem(name: "id", value: id)
            case .managedByMe(let isEnabled):
                return URLQueryItem(name: "managedByMe", value: isEnabled.stringValue)
            case .mine(let isEnabled):
                return URLQueryItem(name: "mine", value: isEnabled.stringValue)
            }
        }
    }
}
