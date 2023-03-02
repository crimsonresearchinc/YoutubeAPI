//
//  Dictionary+QueryItems.swift
//
//  Created by Waqar Malik on 3/1/23.
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    mutating func appendingQueryParameter(key: String, value: Any?) {
        if let value = value {
            self[key] = value
        }
    }

    mutating func appendingQueryParameter<T: RawRepresentable>(key: String, value: T?) where T.RawValue == String {
        if let value = value {
            self[key] = value.rawValue
        }
    }
}
