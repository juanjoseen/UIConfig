//
//  SuccessView.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 12/12/22.
//

import UIKit
import Lottie

public protocol SuccessDelegate: AnyObject {
    func didEndSuccess()
}

open class SuccessView: UIViewController {
    
    private var strTitle: String? = "Éxito"
    private var message: String?
    private var success: AnimationView = Lottie.success
    
    public weak var delegate: SuccessDelegate?
    
    public convenience init(title: String? = nil, message: String? = nil) {
        self.init()
        self.strTitle = title
        self.message = message
    }

    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configUI()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        success.play()
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.didEndSuccess()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
    
    private func configUI() {
        view.backgroundColor = .clear
        modalPresentationStyle = .overCurrentContext
        
        let bgView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        let lblTitle:   UILabel = UILabel(text: strTitle, font: .title(35), alignment: .center)
        let lblMessage: UILabel = UILabel(text: message, font: .title, alignment: .center)
        let btnAccept:  UIButton = UIButton(title: "Aceptar", color: .white, bgColor: .success, radius: .standardRadius)
        
        btnAccept.addTarget(self, action: #selector(actionAccept), for: .touchUpInside)
        
        bgView.contentView.addSubview(lblTitle)
        bgView.contentView.addSubview(lblMessage)
        bgView.contentView.addSubview(success)
        bgView.contentView.addSubview(btnAccept)
        
        view.addSubview(bgView)
        
        NSLayoutConstraint.activate([
            bgView.topAnchor.constraint(equalTo: view.topAnchor),
            bgView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bgView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            lblTitle.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: .padding),
            lblTitle.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: .padding),
            lblTitle.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: .inversePadding),
            
            lblMessage.leadingAnchor.constraint(equalTo: lblTitle.leadingAnchor),
            lblMessage.trailingAnchor.constraint(equalTo: lblTitle.trailingAnchor),
            lblMessage.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: .padding * 3.0),
            
            success.heightAnchor.constraint(equalTo: success.widthAnchor),
            success.topAnchor.constraint(equalTo: lblMessage.bottomAnchor, constant: .padding),
            success.leadingAnchor.constraint(equalTo: lblMessage.leadingAnchor, constant: .padding),
            success.trailingAnchor.constraint(equalTo: lblMessage.trailingAnchor, constant: .inversePadding),
            
            btnAccept.heightAnchor.constraint(equalToConstant: .buttonHeight),
            btnAccept.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: .padding),
            btnAccept.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: .inversePadding),
            btnAccept.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: .inversePadding),
        ])
    }
    
    @objc private func actionAccept() {
        dismiss(animated: true)
    }
}
