//
//  Authentication.swift
//
//  Created by Waqar Malik on 3/3/23.
//

import Foundation

public struct Authentication: Codable, Hashable, Sendable {
    public let accessToken: String
    public let apiKey: String
    public let expirationDate: Date?

    public init(accessToken: String, apiKey: String, expirationDate: Date?) {
        self.accessToken = accessToken
        self.apiKey = apiKey
        self.expirationDate = expirationDate
    }
}
