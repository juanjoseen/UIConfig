//
//  UILabel.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 21/11/22.
//

import UIKit

public extension UILabel {
    convenience init(text: String? = nil, color: UIColor = .textColor, font: UIFont, alignment: NSTextAlignment = .left) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.adjustsFontSizeToFitWidth = true
        self.textAlignment = alignment
        self.numberOfLines = 0
        self.textColor = color
        self.text = text
        self.font = font
    }
}
