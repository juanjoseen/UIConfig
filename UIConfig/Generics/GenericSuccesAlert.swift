//
//  GenericSuccesAlert.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 17/02/23.
//

import UIKit

open class GenericSuccessAlert: UIViewController {
    var alertTitle: String!
    var message: String!
    var okTitle: String!
    var color: UIColor!
    
    public weak var delegate: SuccessDelegate?
    
    public convenience init(alertTitle: String, message: String, okTitle: String = "Accept", color: UIColor = .success) {
        self.init()
        self.alertTitle = alertTitle
        self.message = message
        self.okTitle = okTitle
        self.color = color
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .clear
        
        let blur: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blur.translatesAutoresizingMaskIntoConstraints = false
        
        let baseView: UIView = UIView(radius: 12, color: .bgColor)
        
        let imgCheck: UIImageView = UIImageView(name: "checkmark.circle.fill", size: 90, tint: color)
        
        let lblTitle: UILabel = UILabel(text: alertTitle, color: .titleColor, font: .title(25), alignment: .center)
        lblTitle.numberOfLines = 2
        
        let lblMessage: UILabel = UILabel(text: message, font: .regular(17), alignment: .center)
        lblMessage.numberOfLines = 0
        
        let btnOk: UIButton = UIButton(title: okTitle, color: .white, bgColor: color, radius: .standardRadius)
        btnOk.addTarget(self, action: #selector(actionOk), for: .touchUpInside)
        
        baseView.addSubview(imgCheck)
        baseView.addSubview(lblTitle)
        baseView.addSubview(lblMessage)
        baseView.addSubview(btnOk)
        
        view.addSubview(blur)
        view.addSubview(baseView)
        
        NSLayoutConstraint.activate([
            blur.topAnchor.constraint(equalTo: view.topAnchor),
            blur.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blur.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blur.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            baseView.bottomAnchor.constraint(equalTo: btnOk.bottomAnchor, constant: 16),
            baseView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 80),
            baseView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            baseView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            imgCheck.heightAnchor.constraint(equalToConstant: 90),
            imgCheck.widthAnchor.constraint(equalTo: imgCheck.heightAnchor),
            imgCheck.centerXAnchor.constraint(equalTo: baseView.centerXAnchor),
            imgCheck.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 16),
            
            lblTitle.topAnchor.constraint(equalTo: imgCheck.bottomAnchor, constant: 8),
            lblTitle.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 16),
            lblTitle.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -16),
            
            lblMessage.leadingAnchor.constraint(equalTo: lblTitle.leadingAnchor),
            lblMessage.trailingAnchor.constraint(equalTo: lblTitle.trailingAnchor),
            lblMessage.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 16),
            
            btnOk.heightAnchor.constraint(equalToConstant: 46),
            btnOk.leadingAnchor.constraint(equalTo: lblMessage.leadingAnchor),
            btnOk.trailingAnchor.constraint(equalTo: lblMessage.trailingAnchor),
            btnOk.topAnchor.constraint(equalTo: lblMessage.bottomAnchor, constant: 24),
        ])
    }
    
    @objc func actionOk() {
        dismiss(animated: false)
    }
}
