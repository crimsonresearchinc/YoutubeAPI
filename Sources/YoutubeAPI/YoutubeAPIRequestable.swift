//
//  YoutubeAPIRequestable.swift
//  
//
//  Created by Waqar Malik on 5/11/23.
//

import Foundation
import URLRequestable
import YoutubeModel

public protocol YoutubeAPIRequestable: URLRequestable {
    var apiVersion: String { get }
    var isAuthorizedRequest: Bool { get }
}

public extension YoutubeAPIRequestable {
    var apiVersion: String {
        "v3"
    }
    
    var apiBaseURLString: String {
        "https://www.googleapis.com/youtube"
    }

    var isAuthorizedRequest: Bool {
        true
    }
    
    static var acceptableStatusCodes: Range<Int> {
        200 ..< 300
    }
    
    static var acceptableContentTypes: Set<String> {
        [.jsonUTF8, .json]
    }
}

extension YoutubeAPIRequestable where Response: Decodable {
    public var transformer: ResponseTransformer {
        { result in
            guard let httpResponse = result.response as? HTTPURLResponse else {
                throw URLError(.badServerResponse)
            }

            let data = try result.data.url_validateNotEmptyData()
            let decoder = JSONDecoder()
            // Check valid response code
            guard Self.acceptableStatusCodes.contains(httpResponse.statusCode) else {
                let errorResponse = try decoder.decode(ErrorResponse.self, from: data)
                throw errorResponse.error
            }

            guard let contentType = httpResponse.allHeaderFields[HTTPHeaderType.contentType] as? String else {
                throw URLError(.badServerResponse)
            }
            if !Self.acceptableContentTypes.contains(contentType) {
                throw URLError(.dataNotAllowed)
            }

            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode(Response.self, from: data)
        }
    }
}
