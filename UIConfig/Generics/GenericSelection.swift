//
//  GenericSelection.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 22/12/22.
//

import UIKit

public protocol GenericSelectionDelegate: AnyObject {
    func didCancel(selection: GenericSelection)
    func didSelect(_ selection: GenericSelection, index: Int)
    func didSelect(_ selection: GenericSelection, indexes: [Int])
}

open class GenericSelection: UIViewController {
    
    private lazy var bgView: UIView = {
        let view: UIView = UIView(radius: 40, color: .systemBackground)
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stack: UIStackView = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = .padding
        return stack
    }()
    
    private var multipleSelection: Bool!
    private var options: [String]!
    private var titleMessage: String?
    private var acceptTitle: String!
    
    public weak var delegate: GenericSelectionDelegate?
    
    private var selectedIndexes: [Int] = []
    
    public convenience init(title: String? = nil, accept: String = "Aceptar", options: [String], multipleSelection: Bool = false) {
        self.init()
        self.options = options
        self.acceptTitle = accept
        self.titleMessage = title
        self.multipleSelection = multipleSelection
    }

    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    private func configUI() {
        view.backgroundColor = .clear
        
        modalPresentationStyle = .overCurrentContext
        view.backgroundColor = .clear
        
        let blurView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        let btnAccept: UIButton = UIButton(title: acceptTitle, color: .white, bgColor: .success, radius: .standardRadius)
        btnAccept.addTarget(self, action: #selector(actionAccept), for: .touchUpInside)
        
        let lblTitle: UILabel = UILabel(text: titleMessage, font: .title(25), alignment: .center)
        
        for (index, option) in options.enumerated() {
            let btnOption: UIButton = getSelectionButton(title: option, isMultiple: multipleSelection, index: index)
            stackView.addArrangedSubview(btnOption)
        }
        
        blurView.contentView.addSubview(bgView)
        bgView.addSubview(btnAccept)
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
            bgView.topAnchor.constraint(equalTo: lblTitle.topAnchor, constant: .inversePadding * 2.0),
            
            btnAccept.heightAnchor.constraint(equalToConstant: .buttonHeight),
            btnAccept.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: .padding * 1.5),
            btnAccept.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: .inversePadding * 1.5),
            btnAccept.bottomAnchor.constraint(equalTo: blurView.safeAreaLayoutGuide.bottomAnchor, constant: .inversePadding),
            
            stackView.heightAnchor.constraint(equalToConstant: CGFloat(options.count) * 60.0),
            stackView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: .padding * 1.5),
            stackView.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: .inversePadding * 1.5),
            stackView.bottomAnchor.constraint(equalTo: btnAccept.topAnchor, constant: .inversePadding * 1.5),
            
            lblTitle.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: .padding),
            lblTitle.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: .inversePadding),
            lblTitle.bottomAnchor.constraint(equalTo: stackView.topAnchor, constant: .inversePadding * 2.0),
        ])
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        actionCancel()
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
    
    public func selectIndex(_ index: Int) {
        if index < stackView.arrangedSubviews.count && index >= 0 {
            if let button: UIButton = stackView.arrangedSubviews[index] as? UIButton {
                select(button)
            }
        }
    }
    
    public func selectIndexes(_ indexes: [Int]) {
        if indexes.count > 0 {
            for index in indexes {
                selectIndex(index)
            }
        }
    }
    
    @objc private func actionAccept() {
        hideView {
            self.dismiss(animated: false)
        }
    }
    
    @objc private func actionCancel() {
        hideView {
            self.dismiss(animated: false) {
                self.delegate?.didCancel(selection: self)
            }
        }
    }
    
    private func getSelectionButton(title: String, isMultiple: Bool, index: Int) -> UIButton {
        let btnOption: UIButton = UIButton(title: title, color: .white, bgColor: .systemBlue, radius: .standardRadius)
        btnOption.tag = index
        btnOption.addTarget(self, action: #selector(actionOption(_:)), for: .touchUpInside)
        
        let imgSelection: UIImageView = unselectedImage()
        addImage(imgSelection, to: btnOption)
        
        return btnOption
    }
    
    private func selectedImage() -> UIImageView {
        let name: String = multipleSelection ? "checkmark.square.fill" : "checkmark.circle.fill"
        return UIImageView(name: name, isSystem: true, tint: .white)
    }
    
    private func unselectedImage() -> UIImageView {
        let name: String = multipleSelection ? "square" : "circle"
        return UIImageView(name: name, isSystem: true, tint: .white)
    }
    
    @objc private func actionOption(_ sender: UIButton) {
        if !multipleSelection {
            for sub in stackView.arrangedSubviews {
                if let btn: UIButton = sub as? UIButton {
                    unselect(btn)
                }
            }
        }
        if sender.isSelected {
            unselect(sender)
            removeIndex(sender.tag)
        } else {
            select(sender)
            addIndex(sender.tag)
        }
    }
    
    private func addIndex(_ index: Int) {
        if multipleSelection {
            if !selectedIndexes.contains(index) {
                selectedIndexes.append(index)
            }
            delegate?.didSelect(self, indexes: selectedIndexes)
        } else {
            delegate?.didSelect(self, index: index)
        }
    }
    
    private func removeIndex(_ index: Int) {
        if multipleSelection {
            if selectedIndexes.contains(index) {
                selectedIndexes.removeAll(where: { $0 == index })
                delegate?.didSelect(self, indexes: selectedIndexes)
            }
        }
    }
    
    private func select(_ button: UIButton) {
        for sub in button.subviews {
            if sub is UIImageView {
                sub.removeFromSuperview()
            }
        }
        button.isSelected = true
        addImage(selectedImage(), to: button)
    }
    
    private func unselect(_ button: UIButton) {
        for sub in button.subviews {
            if sub is UIImageView {
                sub.removeFromSuperview()
            }
        }
        button.isSelected = false
        addImage(unselectedImage(), to: button)
    }
    
    private func addImage(_ image: UIImageView, to button: UIButton) {
        button.addSubview(image)
        
        NSLayoutConstraint.activate([
            image.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: .inversePadding),
            image.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            image.widthAnchor.constraint(equalToConstant: 26),
        ])
    }
}
