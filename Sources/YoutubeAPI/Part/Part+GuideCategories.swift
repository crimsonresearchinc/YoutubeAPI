//
//  Part+GuideCategories.swift
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation

extension Part {
    @frozen
    public enum GuideCategories: String, Hashable, CaseIterable, Sendable {
        case id
        case snippet
    }
}
