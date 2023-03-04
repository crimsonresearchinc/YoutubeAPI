//
//  YoutubeAPI.swift
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation
import WebService
import WebServiceConcurrency
import os.log

private let api = Logger(subsystem: "com.waqarmalik.YoutubeAPI", category: "YoutubeAPI")

public final class YoutubeAPI {
    public static let youtubeDataAPIVersion = "v3"
    public var authentication: Authentication?

    public typealias Transformer<T> = WebService.DataMapper<WebService.DataResponse, T>

    public let webService: WebService

    public init(webService: WebService = .init(session: .shared)) {
        self.webService = webService
    }

    public func decoded<T: URLRequestable>(route: T, parameters: [String: Any]? = nil, headers: HTTPHeaders? = nil, transformer: Transformer<T.Response>? = nil) async throws -> T.Response {
        var queryItems = parameters?.compactMap({ (key: String, value: Any) in
            URLQueryItem(name: key, value: String(describing: value))
        })

        if let item = authentication?.apiKeyQueryItem, route.isAuthorizedRequest {
            queryItems?.append(item)
        }

        var newHeaders = headers
        if route.isAuthorizedRequest, let header = authentication?.tokenHeader {
            if newHeaders == nil {
                newHeaders = HTTPHeaders()
            }
            newHeaders?.add(header)
        }
        let request = try route.urlRequest(headers: newHeaders, queryItems: queryItems)
        return try await webService.data(for: request, transform: transformer ?? route.transformer)
    }
}
