//
//  File.swift
//  
//
//  Created by Waqar Malik on 3/3/23.
//

import Foundation
import WebService

extension Authentication {
    var apiKeyQueryItem: URLQueryItem {
        URLQueryItem(name: "key", value: apiKey) // API_KEY
    }

    var tokenHeader: HTTPHeader {
        .authorization(token: accessToken) // ACCESS_TOKEN
    }
}
