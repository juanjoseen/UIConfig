//
//  String.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 10/12/22.
//

import Foundation

public extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
