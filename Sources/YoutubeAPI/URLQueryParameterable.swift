//
//  QueryParameterable.swift
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation

public protocol URLQueryParameterable {
    var queryItem: URLQueryItem { get }
}
