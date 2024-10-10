//
//  CGFloat.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 11/12/22.
//

import UIKit

public extension CGFloat {
    static let buttonRadius: CGFloat = 8.0
    static let buttonHeight:   CGFloat = 46.0
    static let lineHeight:     CGFloat = 1.0
    static let padding:        CGFloat = 16.0
    
    static func padding(_ multiplier: CGFloat) -> CGFloat {
        return Self.padding * multiplier
    }
}
