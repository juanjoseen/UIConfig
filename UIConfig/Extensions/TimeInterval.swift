//
//  TimeInterval.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 09/03/23.
//

import UIKit

public extension TimeInterval {
    static let minute: TimeInterval = 60
    static let hour: TimeInterval = Self.minute * 60
    static let day: TimeInterval = Self.hour * 24
    static let week: TimeInterval = Self.day * 7
}
