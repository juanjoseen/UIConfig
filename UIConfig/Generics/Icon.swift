//
//  Icon.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 04/10/24.
//

import UIKit

public struct Icon {
    public let name: String
    public let isSystemImage: Bool
    
    public init(name: String, isSystemImage: Bool) {
        self.name = name
        self.isSystemImage = isSystemImage
    }
    
    public var image: UIImage {
        if isSystemImage {
            return UIImage(systemName: name) ?? UIImage()
        }
        return UIImage(named: name) ?? UIImage()
    }
}
