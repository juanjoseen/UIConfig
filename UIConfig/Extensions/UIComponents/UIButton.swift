//
//  UIButton.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 21/11/22.
//

import UIKit

public extension UIButton {
    convenience init(title: String, color: UIColor = .systemBlue, bgColor: UIColor = .clear, isBordered: Bool = false, border: UIColor = .clear, width: CGFloat = 0.0, radius: CGFloat = 0.0) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.setTitleColor(color, for: .normal)
        self.backgroundColor = bgColor
        if isBordered {
            self.layer.borderColor = border.cgColor
            self.layer.borderWidth = width
        }
        self.layer.cornerRadius = radius
        self.addTarget(self, action: #selector(pressedDown), for: .touchDown)
        self.addTarget(self, action: #selector(pressedUp), for: .touchUpInside)
        self.addTarget(self, action: #selector(pressedUp), for: .touchUpOutside)
    }
    
    convenience init(image: String, isSystem: Bool = false, size: CGFloat = 30, color: UIColor = .textColor) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        if isSystem {
            self.setImage(UIImage.system(named: image, size: size), for: .normal)
        } else {
            self.setImage(UIImage(named: image), for: .normal)
        }
        tintColor = color
        
        self.addTarget(self, action: #selector(pressedDown), for: .touchDown)
        self.addTarget(self, action: #selector(pressedUp), for: .touchUpInside)
        self.addTarget(self, action: #selector(pressedUp), for: .touchUpOutside)
    }
    
    private func impact() {
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
    }
    
    @objc func pressedDown() {
        UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseOut) {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        } completion: { didFinished in
            self.impact()
        }
    }
    
    @objc func pressedUp() {
        UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseIn) {
            self.transform = .identity
        }
    }
}
