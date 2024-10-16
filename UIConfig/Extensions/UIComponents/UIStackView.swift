//
//  UIStackView.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 10/10/24.
//

import UIKit

public extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat = 8.0, distribution: UIStackView.Distribution = .fillEqually, alignment: Alignment = .fill, views: [UIView] = []) {
        if views.isEmpty {
            self.init()
        } else {
            self.init(arrangedSubviews: views)
        }
        translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }
}
