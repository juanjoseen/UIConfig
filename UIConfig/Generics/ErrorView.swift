//
//  ErrorView.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 13/12/22.
//

import UIKit
import Lottie

public protocol ErrorDelegate: AnyObject {
    func didEndError()
}

class ErrorView: UIViewController {
    
    private var strTitle: String? = "Error!"
    private var message: String?
    private var failure: LottieAnimationView = Lottie.fail
    
    public weak var delegate: ErrorDelegate?
    
    public convenience init(title: String? = nil, message: String? = nil) {
        self.init()
        self.strTitle = title
        self.message = message
        modalPresentationStyle = .overCurrentContext
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configUI()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        failure.play()
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        delegate?.didEndError()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
    
    private func configUI() {
        view.backgroundColor = .clear
        
        let bgView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        bgView.translatesAutoresizingMaskIntoConstraints = false
        
        let lblTitle:   UILabel = UILabel(text: strTitle, font: .title(35), alignment: .center)
        let lblMessage: UILabel = UILabel(text: message, font: .title, alignment: .center)
        let btnAccept:  UIButton = UIButton(title: "Aceptar", color: .white, bgColor: .failure, radius: .standardRadius)
        
        btnAccept.addTarget(self, action: #selector(actionAccept), for: .touchUpInside)
        
        bgView.contentView.addSubview(lblTitle)
        bgView.contentView.addSubview(lblMessage)
        bgView.contentView.addSubview(failure)
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
            
            failure.heightAnchor.constraint(equalTo: failure.widthAnchor),
            failure.topAnchor.constraint(equalTo: lblMessage.bottomAnchor, constant: .padding),
            failure.leadingAnchor.constraint(equalTo: lblMessage.leadingAnchor, constant: .padding),
            failure.trailingAnchor.constraint(equalTo: lblMessage.trailingAnchor, constant: .inversePadding),
            
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
