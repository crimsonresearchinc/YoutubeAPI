//
//  URLRequestable+Defaults.swift
//
//  Created by Waqar Malik on 3/1/23.
//

import Foundation
import WebService

extension URLRequestable {
    public var apiBaseURLString: String {
        "https://www.googleapis.com/youtube/\(YoutubeAPI.youtubeDataAPIVersion)"
    }

    public var headers: HTTPHeaders {
        HTTPHeaders()
            .add(.accept(URLRequest.ContentType.json))
    }

    public var body: Data? {
        nil
    }
    
    public var queryItems: [URLQueryItem]? {
        nil
    }

    public var isAuthorizedRequest: Bool {
        false
    }

    public var authorizationHeader: HTTPHeader? {
        guard isAuthorizedRequest else {
            return nil
        }
        return HTTPHeader.authorization(token: "")
    }

    public func url(queryItems: [URLQueryItem]? = nil) throws -> URL {
        guard var components = URLComponents(string: apiBaseURLString) else {
            throw URLError(.badURL)
        }
        var items = self.queryItems ?? []
        items.append(contentsOf: queryItems ?? [])
        components.appendQueryItems(items)
        components.path = path
        guard let url = components.url else {
            throw URLError(.unsupportedURL)
        }
        return url
    }

    public func urlRequest(headers: HTTPHeaders? = nil, queryItems: [URLQueryItem]? = nil) throws -> URLRequest {
        let url = try url(queryItems: queryItems)
        let request = URLRequest(url: url)
            .setMethod(method)
            .setHeaders(headers?.headers ?? [])
            .addHeaders(self.headers)
            .setHttpBody(body, contentType: URLRequest.ContentType.json)
        return request
    }

    public var transformer: YoutubeAPI.Transformer<Response> {
        { result in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode(Response.self, from: result.data)
        }
    }
}
