//
//  Filter+Videos.swift
//  
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation

extension Filter {
    @frozen
    public enum Videos: URLQueryParameterable, Hashable, Sendable {
        case chart
        case id(String)
        case myRating(MyRating)

        public var queryItem: URLQueryItem {
            switch self {
            case .chart:
                return URLQueryItem(name: "chart", value: "mostPopular")
            case .id(let videoId):
                return URLQueryItem(name: "id", value: videoId)
            case .myRating(let myRating):
                return URLQueryItem(name: "myRating", value: myRating.rawValue)
            }
        }
    }
}
