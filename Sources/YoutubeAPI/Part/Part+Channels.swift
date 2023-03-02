//
//  Part+Channels.swift
//  
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation

extension Part {
    @frozen
    public enum Channels: String, Hashable, CaseIterable, Sendable {
        case id
        case snippet
        case brandingSettings
        case contentDetails
        case invideoPromotion
        case statistics
        case topicDetails
    }
}
