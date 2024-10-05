//
//  GenericToast.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 08/02/23.
//

import UIKit

public enum ToastType {
    case Success
    case Error
    case Info
    
    var color: UIColor {
        switch self {
        case .Success:
            return .success
        case .Error:
            return .failure
        case .Info:
            return .info
        }
    }
}

public class GenericToast: UIView {
    var time: TimeInterval = 3.0
    
    var type: ToastType = .Info {
        didSet {
            backgroundColor = type.color
        }
    }
    
    var message: String = "" {
        didSet {
            lblMessage.text = message
        }
    }
    
    lazy var lblMessage: UILabel = {
        let label: UILabel = UILabel(color: .white, font: .regular(20), alignment: .center)
        label.numberOfLines = 2
        return label
    }()
    
    public convenience init(type: ToastType, message: String, time: TimeInterval = 3.0) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10
        self.type = type
        self.message = message
        self.time = time
        self.lblMessage.text = message
        self.backgroundColor = type.color
        
        addSubview(lblMessage)
        
        NSLayoutConstraint.activate([
            lblMessage.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            lblMessage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            lblMessage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            lblMessage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    public func showIn(_ view: UIView) {
        DispatchQueue.main.async {
            view.addSubview(self)
            
            NSLayoutConstraint.activate([
                self.heightAnchor.constraint(equalToConstant: 50),
                self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                self.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -100),
            ])
            
            UIView.animate(withDuration: 0.15, delay: 0.0, options: .curveEaseOut) {
                self.transform = CGAffineTransform(translationX: 0, y: 100)
            } completion: { didFinish in
                UIView.animate(withDuration: 0.15, delay: self.time, options: .curveEaseIn) {
                    self.transform = .identity
                } completion: { finished in
                    self.removeFromSuperview()
                }
            }
        }
    }
}
