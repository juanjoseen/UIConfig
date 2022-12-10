//
//  Bundle.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 10/12/22.
//

import Foundation

public extension Bundle {
    static var local: Bundle {
        get {
            return Bundle(for: Lottie.self)
        }
    }
}
