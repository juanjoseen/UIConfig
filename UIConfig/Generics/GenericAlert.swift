//
//  GenericAlert.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 26/02/23.
//

import UIKit

public enum AlertType {
    case success
    case error
    case info
    case warning
    
    var color: UIColor {
        switch self {
        case .success:
            return .success
        case .error:
            return .failure
        case .info:
            return .info
        case .warning:
            return .warning
        }
    }
    
    var imageName: String {
        switch self {
        case .success:
            return "checkmark.circle.fill"
        case .error:
            return "xmark.circle.fill"
        case .info:
            return "info.circle.fill"
        case .warning:
            return "exclamationmark.triangle.fill"
        }
    }
}

public protocol GenericAlertDelegate: AnyObject {
    func willShowAlert(alert: GenericAlert)
    func didShowAlert(alert: GenericAlert)
    func willEndShowingAlert(alert: GenericAlert)
    func didEndShowingAlert(alert: GenericAlert)
}

public extension GenericAlertDelegate {
    func willShowAlert(alert: GenericAlert) {}
    func didShowAlert(alert: GenericAlert) {}
    func willEndShowingAlert(alert: GenericAlert) {}
    func didEndShowingAlert(alert: GenericAlert) {}
}

open class GenericAlert: UIViewController {
    var alertTitle: String!
    var message: String!
    var okTitle: String!
    var color: UIColor!
    var type: AlertType!
    var imageColor: UIColor!
    var alignment: NSTextAlignment!
    
    public weak var delegate: GenericAlertDelegate?
    
    public convenience init(alertTitle: String, message: String, textAlignment: NSTextAlignment = .center, okTitle: String = "Accept", type: AlertType, color: UIColor? = nil, imageColor: UIColor? = nil) {
        self.init()
        self.alertTitle = alertTitle
        self.message = message
        self.okTitle = okTitle
        self.type = type
        self.color = color ?? type.color
        self.imageColor = imageColor ?? type.color
        self.alignment = textAlignment
        modalPresentationStyle = .overCurrentContext
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .clear
        
        let blur: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        blur.translatesAutoresizingMaskIntoConstraints = false
        
        let baseView: UIView = UIView(radius: 12, color: .bgColor)
        baseView.shadow()
        
        let imgCheck: UIImageView = UIImageView(name: type.imageName, size: 72, tint: imageColor)
        
        let lblTitle: UILabel = UILabel(text: alertTitle, color: .titleColor, font: .title(25), alignment: .center)
        lblTitle.numberOfLines = 2
        
        let lblMessage: UILabel = UILabel(text: message, font: .regular(17), alignment: self.alignment)
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
            
            imgCheck.heightAnchor.constraint(equalToConstant: 72),
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
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        delegate?.willShowAlert(alert: self)
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delegate?.didShowAlert(alert: self)
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.willEndShowingAlert(alert: self)
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        delegate?.didEndShowingAlert(alert: self)
    }
    
    @objc func actionOk() {
        dismiss(animated: true)
    }
}
