//
//  ViewController.swift
//  UIConfigApp
//
//  Created by Juan Jose Elias Navarro on 10/12/22.
//

import UIKit
import UIConfig

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    func setupUI() {
        let stack: UIStackView = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        stack.distribution = .fillEqually
        
        let btnSuccess: UIButton = UIButton(title: "Show Success Toast", color: .white, bgColor: .systemBlue, radius: .standardRadius)
        let btnError: UIButton = UIButton(title: "Show Error Toast", color: .white, bgColor: .systemBlue, radius: .standardRadius)
        let btnInfo: UIButton = UIButton(title: "Show Info Toast", color: .white, bgColor: .systemBlue, radius: .standardRadius)
        
        btnSuccess.addTarget(self, action: #selector(actionSuccess), for: .touchUpInside)
        btnError.addTarget(self, action: #selector(actionError), for: .touchUpInside)
        btnInfo.addTarget(self, action: #selector(actionInfo), for: .touchUpInside)
        
        view.addSubview(stack)
        
        stack.addArrangedSubview(btnSuccess)
        stack.addArrangedSubview(btnError)
        stack.addArrangedSubview(btnInfo)
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    @objc func actionSuccess() {
        let success: GenericToast = GenericToast(type: .Success, message: "Success!!")
        success.showIn(self.view)
    }
    
    @objc func actionError() {
        let error: GenericToast = GenericToast(type: .Error, message: "Error!!")
        error.showIn(self.view)
    }
    
    @objc func actionInfo() {
        let info: GenericToast = GenericToast(type: .Info, message: "Info!!")
        info.showIn(self.view)
    }

}

