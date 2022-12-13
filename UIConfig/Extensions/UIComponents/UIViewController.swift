//
//  UIViewController.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 10/12/22.
//

import UIKit
import Lottie

var blurEffect: UIVisualEffectView = {
    let blur: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    blur.translatesAutoresizingMaskIntoConstraints = false
    return blur
}()

public extension UIViewController {
    
    var safeArea: UILayoutGuide {
        return view.safeAreaLayoutGuide
    }
    
    func pushVC(_ viewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func popVC(animated: Bool = true) {
        navigationController?.popViewController(animated: animated)
    }
    
    func showSuccess(title: String? = nil, message: String? = nil, delegate: SuccessDelegate? = nil) {
        let successVC: SuccessView = SuccessView(title: title, message: message)
        successVC.delegate = delegate
        present(successVC, animated: true)
    }
    
    func showError(title: String? = nil, message: String? = nil, delegate: ErrorDelegate? = nil) {
        let errorVC: ErrorView = ErrorView(title: title, message: message)
        errorVC.delegate = delegate
        present(errorVC, animated: true)
    }
    
    func showLoading(message: String? = nil) {
        
        let lblMessage: UILabel = UILabel(text: message, color: .white, font: .title(30), alignment: .center)
        let loading: AnimationView = Lottie.loading
        
        blurEffect.contentView.addSubview(loading)
        blurEffect.contentView.addSubview(lblMessage)
        
        loading.play()
        
        view.addSubview(blurEffect)
        
        NSLayoutConstraint.activate([
            blurEffect.topAnchor.constraint(equalTo: view.topAnchor),
            blurEffect.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blurEffect.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurEffect.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            loading.heightAnchor.constraint(equalTo: loading.widthAnchor),
            loading.bottomAnchor.constraint(equalTo: blurEffect.centerYAnchor),
            loading.leadingAnchor.constraint(equalTo: blurEffect.leadingAnchor, constant: 64),
            loading.trailingAnchor.constraint(equalTo: blurEffect.trailingAnchor, constant: -64),
            
            lblMessage.topAnchor.constraint(equalTo: loading.bottomAnchor, constant: 16),
            lblMessage.leadingAnchor.constraint(equalTo: blurEffect.leadingAnchor, constant: 24),
            lblMessage.trailingAnchor.constraint(equalTo: blurEffect.trailingAnchor, constant: -24),
        ])
    }
    
    func stopLoading() {
        let loading: AnimationView = Lottie.loading
        loading.stop()
        
        for sub in blurEffect.contentView.subviews {
            sub.removeFromSuperview()
        }
        
        blurEffect.removeFromSuperview()
    }
}
