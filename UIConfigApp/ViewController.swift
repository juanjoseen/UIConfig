//
//  ViewController.swift
//  UIConfigApp
//
//  Created by Juan Jose Elias Navarro on 10/12/22.
//

import UIKit
import UIConfig

class ViewController: UIViewController {
    
    lazy var darkMode: RadiusSelection = {
        let selection: RadiusSelection = RadiusSelection(with: [
            SelectionItem(title: "On"),
            SelectionItem(title: "Off"),
            SelectionItem(title: "System", subTitle: "We'll change appearence according to the system preferences")
        ], titleMessage: "Dark Mode", color: .purple)
        
        selection.delegate = self
        return selection
    }()
    
    lazy var currencies: MultipleSelection = {
        let selection: MultipleSelection = MultipleSelection(with: [
            SelectionItem(title: "USD"),
            SelectionItem(title: "MXN"),
            SelectionItem(title: "EUR"),
            SelectionItem(title: "CAD"),
            SelectionItem(title: "AUD")
        ], titleMessage: "Currencies", acceptTitle: "Aceptar", color: .systemGreen)
        
        selection.delegate = self
        return selection
    }()

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
        
        let btnSuccess: UIButton = UIButton(title: "Show Success Toast", color: .white, bgColor: .success, radius: .standardRadius)
        let btnError: UIButton = UIButton(title: "Show Error Toast", color: .white, bgColor: .failure, radius: .standardRadius)
        let btnInfo: UIButton = UIButton(title: "Show Info Toast", color: .white, bgColor: .info, radius: .standardRadius)
        
        btnSuccess.addTarget(self, action: #selector(actionSuccess), for: .touchUpInside)
        btnError.addTarget(self, action: #selector(actionError), for: .touchUpInside)
        btnInfo.addTarget(self, action: #selector(actionInfo), for: .touchUpInside)
        
        let btnRadius: UIButton = UIButton(title: "Show Radius Selection", color: .white, bgColor: .systemBlue, radius: .standardRadius)
        btnRadius.addTarget(self, action: #selector(actionRadius), for: .touchUpInside)
        
        let btnCurrencies: UIButton = UIButton(title: "Show Multiple Selection", color: .white, bgColor: .systemGreen, radius: .standardRadius)
        btnCurrencies.addTarget(self, action: #selector(actionMultiple), for: .touchUpInside)
        
        view.addSubview(stack)
        
        stack.addArrangedSubview(btnSuccess)
        stack.addArrangedSubview(btnError)
        stack.addArrangedSubview(btnInfo)
        stack.addArrangedSubview(btnRadius)
        stack.addArrangedSubview(btnCurrencies)
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.heightAnchor.constraint(equalToConstant: 270)
        ])
    }
    
    @objc func actionRadius() {
        present(darkMode, animated: false)
    }
    
    @objc func actionMultiple() {
        present(currencies, animated: false)
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

extension ViewController: RadiusDelegate {
    func didCancel(selection: RadiusSelection) {
        print("Canceled!!!")
    }
    
    func didSelect(item: SelectionItem, on selection: RadiusSelection) {
        print("Selected option: \(item.title)")
    }
}

extension ViewController: MultipleSelectionDelegate {
    func didCancel(selection: MultipleSelection) {
        print("Canceled Multiple!!")
    }
    
    func didSelect(items: [SelectionItem], on selection: MultipleSelection) {
        print("items selected: \(items.count)")
        
        for item in items {
            print("item: \(item.title)")
        }
    }
}
