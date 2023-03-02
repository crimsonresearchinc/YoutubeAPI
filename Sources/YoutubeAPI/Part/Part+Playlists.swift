//
//  Part+Playlists.swift
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation

extension Part {
    @frozen
    public enum Playlists: String, Hashable, CaseIterable, Sendable {
        case id
        case snippet
        case status
    }
}
