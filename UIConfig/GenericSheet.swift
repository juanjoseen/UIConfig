//
//  GenericSheet.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 11/12/22.
//

import UIKit

public protocol GenericSheetDelegate: AnyObject {
    func didCancelSheet(_ sheet: GenericSheet)
    func sheet(_ sheet: GenericSheet, didSelect index: Int)
}

open class GenericSheet: UIViewController {
    
    var titleMessage: String?
    var message: String?
    var buttons: [String] = []
    var cancelTitle: String!
    public var dissmissOnBackgroundTouch: Bool = false
    weak public var delegate: GenericSheetDelegate?
    
    lazy var bgView: UIView = {
        return UIView(color: .systemBackground)
    }()
    
    public convenience init(title: String? = nil, message: String? = nil, buttons: [String], cancelTitle: String = "Cancelar") {
        self.init()
        self.titleMessage = title
        self.message = message
        self.buttons = buttons
        self.cancelTitle = cancelTitle
        
        configUI()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hideView(animated: false)
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showView()
    }
    
    private func hideView(animated: Bool = true, completion: (() -> Void)? = nil) {
        let height: CGFloat = view.screenHeight
        let translate: CGAffineTransform = CGAffineTransform(translationX: 0, y: height)
        if animated {
            UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseIn) {
                self.bgView.transform = translate
            } completion: { finished in
                completion?()
            }
        } else {
            bgView.transform = translate
            completion?()
        }
    }
    
    func showView() {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseOut) {
            self.bgView.transform = .identity
        }
    }
    
    private func configUI() {
        modalPresentationStyle = .overCurrentContext
        view.backgroundColor = .clear
        
        let blurView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        let btnCancel: UIButton = UIButton(title: cancelTitle, color: .white, bgColor: .systemRed, radius: .standardRadius)
        btnCancel.addTarget(self, action: #selector(actionCancel), for: .touchUpInside)
        
        let lblTitle: UILabel = UILabel(text: titleMessage, font: .title(25), alignment: .center)
        
        let stackView: UIStackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = .padding
        
        for (index, button) in buttons.enumerated() {
            let btnOption: UIButton = UIButton(title: button, color: .white, bgColor: .systemBlue, radius: .standardRadius)
            btnOption.tag = index
            btnOption.addTarget(self, action: #selector(actionOption(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(btnOption)
        }
        
        blurView.contentView.addSubview(bgView)
        bgView.addSubview(btnCancel)
        bgView.addSubview(stackView)
        bgView.addSubview(lblTitle)
        
        view.addSubview(blurView)
        
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            bgView.bottomAnchor.constraint(equalTo: blurView.bottomAnchor),
            bgView.leadingAnchor.constraint(equalTo: blurView.leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: blurView.trailingAnchor),
            bgView.topAnchor.constraint(equalTo: lblTitle.topAnchor, constant: .inversePadding),
            
            btnCancel.heightAnchor.constraint(equalToConstant: 46),
            btnCancel.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: .padding * 1.5),
            btnCancel.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: .inversePadding * 1.5),
            btnCancel.bottomAnchor.constraint(equalTo: blurView.safeAreaLayoutGuide.bottomAnchor, constant: .inversePadding),
            
            stackView.heightAnchor.constraint(equalToConstant: CGFloat(buttons.count) * 60.0),
            stackView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: .padding * 1.5),
            stackView.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: .inversePadding * 1.5),
            stackView.bottomAnchor.constraint(equalTo: btnCancel.topAnchor, constant: .inversePadding * 1.5),
            
            lblTitle.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: .padding),
            lblTitle.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: .inversePadding),
            lblTitle.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: .inversePadding * 2.0),
        ])
    }
    
    @objc private func actionCancel() {
        hideView {
            self.dismiss(animated: false) {
                self.delegate?.didCancelSheet(self)
            }
        }
    }
    
    @objc private func actionOption(_ sender: UIButton) {
        hideView {
            self.dismiss(animated: false) {
                self.delegate?.sheet(self, didSelect: sender.tag)
            }
        }
    }
}
