//
//  Filter+ChannelSections.swift
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation

extension Filter {
    @frozen
    public enum ChannelSections: URLQueryParameterable, Hashable, Sendable {
        case channelId(String)
        case id(String)
        case mine(Bool)

        public var queryItem: URLQueryItem {
            switch self {
            case .channelId(let channelId):
                return URLQueryItem(name: "channelId", value: channelId)
            case .id(let id):
                return URLQueryItem(name: "id", value: id)
            case .mine(let isEnabled):
                return URLQueryItem(name: "mine", value: isEnabled.stringValue)
            }
        }
    }
}
