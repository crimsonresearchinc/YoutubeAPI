//
//  URLRequestable.swift
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation
import WebService

public protocol URLRequestable {
    var apiBaseURLString: String { get }
    var method: HTTPMethod { get }
    var path: String { get }
    var headers: HTTPHeaders { get }
    var body: Data? { get }
    var queryItems: [URLQueryItem]? { get }
    var isAuthorizedRequest: Bool { get }

    func url(queryItems: [URLQueryItem]?) throws -> URL
    func urlRequest(headers: HTTPHeaders?, queryItems: [URLQueryItem]?) throws -> URLRequest
}