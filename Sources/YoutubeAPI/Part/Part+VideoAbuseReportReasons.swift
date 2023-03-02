//
//  Part+VideoAbuseReportReasons.swift
//
//  Created by Waqar Malik on 2/20/23.
//

import Foundation

extension Part {
    @frozen
    public enum VideoAbuseReportReasons: String, Hashable, CaseIterable, Sendable {
        case id
        case snippet
    }
}
