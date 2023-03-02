//
//  Filter+CommentThreads.swift
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation

extension Filter {
    @frozen
    public enum CommentThreads: URLQueryParameterable, Hashable, Sendable {
        case allThreadsRelatedToChannelId(String)
        case channelId(String)
        case id(String)
        case videoId(String)

        public var queryItem: URLQueryItem {
           switch self {
           case .allThreadsRelatedToChannelId(let channelId):
               return URLQueryItem(name: "allThreadsRelatedToChannelId", value: channelId)
           case .channelId(let channelId):
               return URLQueryItem(name: "channelId", value: channelId)
           case .id(let id):
               return URLQueryItem(name: "id", value: id)
           case .videoId(let videoId):
               return URLQueryItem(name: "videoId", value: videoId)
            }
        }
    }
}
