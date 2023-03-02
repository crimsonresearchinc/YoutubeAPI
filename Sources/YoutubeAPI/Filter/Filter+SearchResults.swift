//
//  Filter+SearchResults.swift
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation

extension Filter {
    @frozen
    public enum SearchResults: URLQueryParameterable, Hashable, Sendable {
        case forContentOwner(Bool)
        case forMine(Bool)
        case relatedToVideoId(String)

        public var queryItem: URLQueryItem {
            switch self {
            case .forContentOwner(let isEnabled):
                return URLQueryItem(name: "forContentOwner", value: isEnabled.stringValue)
            case .forMine(let isEnabled):
                return URLQueryItem(name: "forMine", value: isEnabled.stringValue)
            case .relatedToVideoId(let videoId):
                return URLQueryItem(name: "relatedToVideoId", value: videoId)
            }
        }
    }
}
