//
//  ButtonsView.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 08/09/24.
//  
//
import UIKit
import UIConfig

class ButtonsView: UIView {
    unowned var controller: ButtonsController!

    init(controller: ButtonsController) {
        self.controller = controller
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .bgColor
        
        // Text Buttons
        let btnSimple: UIButton = UIButton(title: "Simple button", color: .white, bgColor: .systemBlue, isBordered: false)
        let btnRounded: UIButton = UIButton(title: "Rounded button", color: .white, bgColor: .systemBlue, radius: .buttonRadius)
        let btnBordered: UIButton = UIButton(title: "Bordered button", color: .systemBlue, bgColor: .clear, isBordered: true, border: .systemBlue, width: 1)
        let btnRoundedBordered: UIButton = UIButton(title: "Rounded Bordered button", color: .systemBlue, bgColor: .clear, isBordered: true, border: .systemBlue, width: 1, radius: .buttonRadius)
        
        // Image Buttons
        let btnProfile: UIButton = UIButton(image: "person.crop.circle.fill", isSystem: true, size: 46, color: .systemBlue)
        let btnAppStore: UIButton = UIButton(image: "app_store", isSystem: false, size: 60)
        
        addSubview(btnSimple)
        addSubview(btnRounded)
        addSubview(btnBordered)
        addSubview(btnRoundedBordered)
        addSubview(btnProfile)
        addSubview(btnAppStore)
        
        NSLayoutConstraint.activate([
            btnSimple.heightAnchor.constraint(equalToConstant: .buttonHeight),
            btnSimple.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .padding),
            btnSimple.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .padding(-1)),
            btnSimple.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: .padding),
            
            btnRounded.heightAnchor.constraint(equalTo: btnSimple.heightAnchor),
            btnRounded.leadingAnchor.constraint(equalTo: btnSimple.leadingAnchor),
            btnRounded.trailingAnchor.constraint(equalTo: btnSimple.trailingAnchor),
            btnRounded.topAnchor.constraint(equalTo: btnSimple.bottomAnchor, constant: .padding),
            
            btnBordered.heightAnchor.constraint(equalTo: btnRounded.heightAnchor),
            btnBordered.leadingAnchor.constraint(equalTo: btnRounded.leadingAnchor),
            btnBordered.trailingAnchor.constraint(equalTo: btnRounded.trailingAnchor),
            btnBordered.topAnchor.constraint(equalTo: btnRounded.bottomAnchor, constant: .padding),
            
            btnRoundedBordered.heightAnchor.constraint(equalTo: btnBordered.heightAnchor),
            btnRoundedBordered.leadingAnchor.constraint(equalTo: btnBordered.leadingAnchor),
            btnRoundedBordered.trailingAnchor.constraint(equalTo: btnBordered.trailingAnchor),
            btnRoundedBordered.topAnchor.constraint(equalTo: btnBordered.bottomAnchor, constant: .padding),
            
            btnProfile.widthAnchor.constraint(equalTo: btnProfile.heightAnchor),
            btnProfile.heightAnchor.constraint(equalTo: btnRoundedBordered.heightAnchor),
            btnProfile.leadingAnchor.constraint(equalTo: btnRoundedBordered.leadingAnchor),
            btnProfile.topAnchor.constraint(equalTo: btnRoundedBordered.bottomAnchor, constant: .padding),
            
            btnAppStore.heightAnchor.constraint(equalToConstant: 80),
            btnAppStore.widthAnchor.constraint(equalToConstant: 240),
            btnAppStore.leadingAnchor.constraint(equalTo: btnProfile.leadingAnchor),
            btnAppStore.topAnchor.constraint(equalTo: btnProfile.bottomAnchor, constant: .padding),
        ])
    }
}
