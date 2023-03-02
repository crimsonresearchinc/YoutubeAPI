//
//  Part+ChannelSections.swift
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation

extension Part {
    @frozen
    public enum ChannelSections: String, Hashable, CaseIterable, Sendable {
        case id
        case contentDetails
        case localizations
        case snippet
        case targeting
    }
}
