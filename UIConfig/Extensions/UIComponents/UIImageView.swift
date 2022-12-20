//
//  UIImageView.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 19/12/22.
//

import UIKit

public extension UIImageView {
    convenience init(name: String, isSystem: Bool = true, size: CGFloat, tint: UIColor = .textColor) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        if isSystem {
            let image: UIImage? = UIImage.system(named: name, size: size)
            self.image = image
        } else {
            self.image = UIImage(named: name)
        }
        self.tintColor = tint
    }
}
