//
//  URLRequestable+Defaults.swift
//
//  Created by Waqar Malik on 3/1/23.
//

import Foundation
import WebService
import YoutubeModel
import URLRequestable

extension URLRequestable {
    public var youtubeDataAPIVersion: String {
        "v3"
    }
    
    public var apiBaseURLString: String {
        "https://www.googleapis.com/youtube"
    }

    public var isAuthorizedRequest: Bool {
        false
    }

    public var authorizationHeader: HTTPHeader? {
        nil
    }
}

extension URLRequestable where Response: Decodable {
    public var transformer: ResponseTransformer {
        { result in
            guard let httpResponse = result.response as? HTTPURLResponse else {
                throw URLError(.badServerResponse)
            }

            let data = try result.data.url_validateNotEmptyData()
            let decoder = JSONDecoder()
            // Check valid response code
            let acceptableStatusCodes: Range<Int> = 200 ..< 300
            guard acceptableStatusCodes.contains(httpResponse.statusCode) else {
                let errorResponse = try decoder.decode(ErrorResponse.self, from: data)
                throw errorResponse.error
            }

            guard let contentType = httpResponse.allHeaderFields[HTTPHeaderType.contentType] as? String else {
                throw URLError(.badServerResponse)
            }
            let acceptableContentTypes: Set<String>  = [.jsonUTF8, .json]
            if !acceptableContentTypes.contains(contentType) {
                throw URLError(.dataNotAllowed)
            }

            decoder.dateDecodingStrategy = .iso8601
            return try decoder.decode(Response.self, from: data)
        }
    }
}
