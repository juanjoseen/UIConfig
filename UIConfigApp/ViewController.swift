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
        
        let btnRadius: UIButton = UIButton(title: "Show Radius Selection", color: .white, bgColor: .systemBlue, radius: .standardRadius)
        btnRadius.addTarget(self, action: #selector(actionSuccess), for: .touchUpInside)
        
        view.addSubview(stack)
        
        stack.addArrangedSubview(btnRadius)
        
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    @objc func actionSuccess() {
        present(darkMode, animated: false)
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
