//
//  YoutubeAPI.swift
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation
import WebService
import os.log
import URLRequestable

let api = Logger(subsystem: "com.waqarmalik.YoutubeAPI", category: "YoutubeAPI")

public final class YoutubeAPI: URLRequestAsyncTransferable {
    public let session: URLSession
    public var authentication: Authentication?

    public static var sessionConfiguration: URLSessionConfiguration = {
        var config = URLSessionConfiguration.default
        config.headers = HTTPHeaders.defaultHeaders
        config.requestCachePolicy = .useProtocolCachePolicy
        return config
    }()

    public init(session: URLSession = URLSession(configuration: sessionConfiguration)) {
        self.session = session
    }
    
    public func decoded<T: YoutubeAPIRequestable>(route: T, parameters: [String: Any]? = nil, headers: HTTPHeaders? = nil, transformer: T.ResponseTransformer? = nil) async throws -> T.Response {
        api.trace("[IN]: \(route.path), parameters = \(parameters?.description ?? "nil"), headers = \(headers?.description ?? "nil")")
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
        let request = try route.urlRequest(headers: newHeaders?.headers, queryItems: queryItems)
        return try await data(for: request, transformer: transformer ?? route.transformer)
    }
}
