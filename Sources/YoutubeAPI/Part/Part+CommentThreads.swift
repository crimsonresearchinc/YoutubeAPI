//
//  Part+CommentThreads.swift
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation

extension Part {
    @frozen
    public enum CommentThreads: String, Hashable, CaseIterable, Sendable {
        case id
        case replies
        case snippet
    }
}
