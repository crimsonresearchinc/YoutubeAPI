//
//  VideosRequest.swift
//
//  Created by Waqar Malik on 3/1/23.
//

import Foundation
import WebService
import YoutubeModel

/// https://developers.google.com/youtube/v3/docs/videos/list
public struct VideosRequest: URLRequestable {
    public typealias Response = Videos

    public var method: HTTPMethod {
        .GET
    }

    public var path: String {
        "/videos"
    }

    public var isAuthorizedRequest: Bool {
        switch filter {
        case .chart:
            return false
        case .id:
            return false
        case .myRating:
            return true
        }
    }

    public var queryItems: [URLQueryItem]? {
        var queryItems: [URLQueryItem] = []
        if !part.isEmpty {
            let parts: String = self.part.map { $0.rawValue }.joined(separator: ",")
            queryItems.append(URLQueryItem(name: "part", value: parts))
        }
        queryItems.append(filter.queryItem)
        if let maxResults {
            queryItems.append(URLQueryItem(name: "maxResults", value: String(maxResults)))
        }
        if let onBehalfOfContentOwner {
            queryItems.append(URLQueryItem(name: "onBehalfOfContentOwner", value: onBehalfOfContentOwner))
        }
        if let pageToken {
            queryItems.append(URLQueryItem(name: "pageToken", value: pageToken))
        }
        if let regionCode {
            queryItems.append(URLQueryItem(name: "regionCode", value: regionCode))
        }
        if let videoCategoryType {
            queryItems.append(URLQueryItem(name: "videoCategoryID", value: String(videoCategoryType.rawValue)))
        }

        return queryItems
    }

    public let part: [Part.Videos]
    public let filter: Filter.Videos

    public let maxResults: Int?
    public let onBehalfOfContentOwner: String?
    public let pageToken: String?
    public let regionCode: String?
    public let videoCategoryType: VideoCategoryType?

    public init(part: [Part.Videos], filter: Filter.Videos, maxResults: Int? = nil, onBehalfOfContentOwner: String? = nil, pageToken: String? = nil, regionCode: String? = nil, videoCategoryType: VideoCategoryType? = nil) {
        self.part = part
        self.filter = filter
        self.maxResults = maxResults
        self.onBehalfOfContentOwner = onBehalfOfContentOwner
        self.pageToken = pageToken
        self.regionCode = regionCode
        self.videoCategoryType = videoCategoryType
    }
}
