//
//  UIViewController.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 10/12/22.
//

import UIKit

var blurEffect: UIVisualEffectView = {
    let blurEffct: UIBlurEffect = UIBlurEffect(style: .dark)
    let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffct)
    
    let blur: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
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
    
    func showToast(type: ToastType, message: String, time: TimeInterval = 3.0) {
        GenericToast(type: type, message: message, time: time).showIn(self.view)
    }
    
    func showLoading() {
        let loading: AxkanLoadingView = AxkanLoadingView()
        loading.tag = .LOADING_VIEW_TAG
        
        view.addSubview(loading)
        
        NSLayoutConstraint.activate([
            loading.topAnchor.constraint(equalTo: view.topAnchor),
            loading.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loading.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loading.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        loading.startAnimating()
    }
    
    func hideLoading() {
        for sub in view.subviews {
            if sub.tag == .LOADING_VIEW_TAG {
                if let loading: AxkanLoadingView = sub as? AxkanLoadingView {
                    loading.stopAnimating()
                }
                sub.removeFromSuperview()
            }
        }
    }
}
