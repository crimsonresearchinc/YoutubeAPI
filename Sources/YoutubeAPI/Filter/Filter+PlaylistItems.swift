//
//  Filter+PlaylistItems.swift
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation

extension Filter {
    @frozen
    public enum PlaylistItemsList: URLQueryParameterable, Hashable, Sendable {
        case id(String)
        case playlistId(String)

        public var queryItem: URLQueryItem {
            switch self {
            case .id(let id):
                return URLQueryItem(name: "id", value: id)
            case .playlistId(let playlistId):
                return URLQueryItem(name: "playlistId", value: playlistId)
            }
        }
    }
}
