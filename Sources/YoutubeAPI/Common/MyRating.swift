//
//  MyRating.swift
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation

public enum MyRating: String, Hashable, CaseIterable, Sendable {
    /// Returns only videos disliked by the authenticated user.
    case like

    /// Returns only video liked by the authenticated user.
    case dislike
}
