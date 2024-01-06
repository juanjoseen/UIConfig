//
//  HintTextField.swift
//  UIConfigApp
//
//  Created by PALO IT 2023 on 26/09/23.
//

import UIKit

public class HintTextField: UITextField {
    
    private lazy var lblHint: UILabel = {
        let label: UILabel = UILabel(font: .regular(9))
        return label
    }()
    
    public convenience init(hint: String, padding: CGFloat = 0, borderWidth: CGFloat = 0, borderColor: UIColor = .clear, radius: CGFloat = 0) {
        self.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        lblHint.text = hint
        placeholder = nil
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        backgroundColor = .systemBackground
        
        if radius > 0 {
            self.layer.cornerRadius = radius
        }
        
        if padding > 0 {
            let left: UIView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: 1))
            let right: UIView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: 1))
            leftView = left
            rightView = right
            leftViewMode = .always
            rightViewMode = .always
        }
        
        addSubview(lblHint)
        
        NSLayoutConstraint.activate([
            lblHint.bottomAnchor.constraint(equalTo: topAnchor, constant: -2),
            lblHint.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
        ])
    }

}
