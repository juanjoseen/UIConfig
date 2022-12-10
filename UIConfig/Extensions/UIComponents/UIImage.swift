//
//  UIImage.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 21/11/22.
//

import UIKit

public extension UIImage {
    static func system(named: String, size: CGFloat) -> UIImage? {
        let config: UIImage.SymbolConfiguration = UIImage.SymbolConfiguration(pointSize: size)
        return UIImage(systemName: named, withConfiguration: config)
    }
}
