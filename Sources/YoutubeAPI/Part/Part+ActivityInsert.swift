//
//  Part+ActivityInsert.swift
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation

extension Part {
    @frozen
    public enum ActivityInsert: String, Hashable, CaseIterable, Sendable {
        case snippet
        case contentDetails
    }
}
