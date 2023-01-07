//
//  UIView.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 10/12/22.
//

import UIKit

public extension UIView {
    convenience init(radius: CGFloat = 0, color: UIColor = .clear) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = color
        if radius > 0 {
            self.layer.cornerRadius = radius
        }
    }
    
    var screenHeight: CGFloat {
        get {
            return UIScreen.main.bounds.height
        }
    }
    
    var screenWidth: CGFloat {
        get {
            return UIScreen.main.bounds.width
        }
    }
    
    func shadow(color: UIColor = UIColor(white: 0.5, alpha: 1.0), offset: CGSize = .zero, radius: CGFloat = 4.0, opacity: Float = 1.0) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
    }
}
