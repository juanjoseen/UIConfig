//
//  UITextField.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 10/12/22.
//

import UIKit

public extension UITextField {
    convenience init(placeholder: String = "", font: UIFont = .subTitle, bgColor: UIColor = .bgColor, radius: CGFloat = 0, border: CGFloat = 0, borderColor: UIColor = .clear) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = bgColor
        self.placeholder = placeholder
        self.font = font
        if radius > 0 {
            self.layer.cornerRadius = radius
        }
        if border > 0 {
            self.layer.borderColor = borderColor.cgColor
            self.layer.borderWidth = border
        }
    }
}
