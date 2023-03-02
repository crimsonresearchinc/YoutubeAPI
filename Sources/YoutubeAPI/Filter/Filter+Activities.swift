//
//  Filter+Activities.swift
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation

extension Filter {
    @frozen
    public enum Activities: URLQueryParameterable, Hashable, Sendable {
        case channelId(String)
        case home(Bool)
        case mine(Bool)

        public var queryItem: URLQueryItem {
            switch self {
            case .channelId(let channelId):
                return URLQueryItem(name: "channelId", value: channelId)
            case .home(let isEnabled):
                return URLQueryItem(name: "home", value: isEnabled.stringValue)
            case .mine(let isEnabled):
                return URLQueryItem(name: "mine", value: isEnabled.stringValue)
            }
        }
     }
}
