//
//  UITextField.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 10/12/22.
//

import UIKit

public extension UITextField {
    convenience init(placeholder: String = "", font: UIFont = .subTitle, bgColor: UIColor = .bgColor, radius: CGFloat = 0, border: CGFloat = 0, borderColor: UIColor = .clear, padding: CGFloat = 0) {
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
        if padding > 0 {
            let left: UIView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: 1))
            let right: UIView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: 1))
            leftView = left
            rightView = right
            leftViewMode = .always
            rightViewMode = .always
        }
    }
    
    func showError(_ message: String, color: UIColor = .failure) {
        let lblError: UILabel = UILabel(text: message, color: color, font: Avenir.lightItalic(10))
        lblError.tag = .TEXTFIELD_ERROR_TAG
        
        addSubview(lblError)
        
        NSLayoutConstraint.activate([
            lblError.topAnchor.constraint(equalTo: bottomAnchor),
            lblError.heightAnchor.constraint(equalToConstant: 13),
            lblError.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .padding),
            lblError.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .inversePadding),
        ])
        
        layer.borderColor = color.cgColor
    }
    
    func hideError(completion: (() -> Void)? = nil) {
        for sub in subviews {
            if sub.tag == .TEXTFIELD_ERROR_TAG {
                sub.removeFromSuperview()
            }
        }
        completion?()
    }
}
