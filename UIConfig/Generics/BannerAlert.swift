//
//  BannerAlert.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 04/10/24.
//

import UIKit

public typealias BannerAction = () -> Void

public class BannerAlert: UIView {
    
    private var title: String = ""
    private var icon: Icon?
    private var color: UIColor = .bgColor
    private var titleColor: UIColor = .titleColor
    private var action: BannerAction?
    private var timer: Timer?
    private var padding: CGFloat = 48
    
    /**
     Determinate if the banner alert will hide automatically after the time specified in timeout. Default value: true
     */
    public var autoHide: Bool = true
    
    /**
     Determinate the time to hide automatically the banner if autoHide = true
     */
    public var timeout: TimeInterval = 5.0
    
    lazy var lblTitle: UILabel = {
        return UILabel(text: self.title, color: self.titleColor, font: .subtitle)
    }()
    
    lazy var imgIcon: UIImageView = {
        let view: UIImageView = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.tintColor = self.titleColor
        return view
    }()
    
    public convenience init(title: String, icon: Icon? = nil, color: UIColor = .bgColor, titleColor: UIColor = .titleColor, action: BannerAction? = nil) {
        self.init()
        self.title = title
        self.icon = icon
        self.color = color
        self.titleColor = titleColor
        self.action = action
        
        configUI()
    }
    
    private func configUI() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 8
        backgroundColor = self.color
        
        imgIcon.image = icon?.image
        
        if icon != nil {
            imgIcon.widthAnchor.constraint(equalTo: imgIcon.heightAnchor).isActive = true
        } else {
            imgIcon.widthAnchor.constraint(equalToConstant: 0).isActive = true
        }
        
        addSubview(lblTitle)
        addSubview(imgIcon)
        
        NSLayoutConstraint.activate([
            
            imgIcon.topAnchor.constraint(equalTo: topAnchor, constant: .padding(0.5)),
            imgIcon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: .padding(-0.5)),
            imgIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .padding(0.5)),
            
            lblTitle.topAnchor.constraint(equalTo: topAnchor, constant: .padding(0.25)),
            bottomAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: .padding(0.25)),
            lblTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .padding(-1)),
            lblTitle.leadingAnchor.constraint(equalTo: imgIcon.trailingAnchor, constant: .padding(0.5)),
        ])
        
        let swipeUp: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeAlert))
        swipeUp.direction = .up
        swipeUp.numberOfTouchesRequired = 1
        
        addGestureRecognizer(swipeUp)
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        action?()
        DispatchQueue.main.async {
            self.actionHideAlert()
        }
    }
    
    @objc private func didSwipeAlert() {
        DispatchQueue.main.async {
            self.actionHideAlert()
        }
    }
    
    public static func success(title: String, icon: Icon? = nil, action: BannerAction?) -> BannerAlert {
        return BannerAlert(title: title, icon: icon, color: .success, titleColor: .white, action: action)
    }
    
    public static func warning(title: String, icon: Icon? = nil, action: BannerAction?) -> BannerAlert {
        return BannerAlert(title: title, icon: icon, color: .warning, titleColor: .white, action: action)
    }
    
    public static func error(title: String, icon: Icon? = nil, action: BannerAction?) -> BannerAlert {
        return BannerAlert(title: title, icon: icon, color: .failure, titleColor: .white, action: action)
    }
    
    public static func info(title: String, icon: Icon? = nil, action: BannerAction?) -> BannerAlert {
        return BannerAlert(title: title, icon: icon, color: .info, titleColor: .white, action: action)
    }
    
    public func show(in view: UIView) {
        view.addSubview(self)
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            heightAnchor.constraint(equalToConstant: 48),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .padding),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: .padding(-1)),
        ])
        
        self.padding = view.safeAreaInsets.top + 48
        self.transform = CGAffineTransform(translationX: 0, y: -padding)
        
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: .beginFromCurrentState) {
                self?.transform = .identity
            } completion: { finished in
                // Banner alert is showed and start a timer to hide it
                self?.startTimer()
            }
        }
    }
    
    private func startTimer() {
        if autoHide {
            self.timer = Timer.scheduledTimer(timeInterval: timeout, target: self, selector: #selector(self.actionHideAlert), userInfo: nil, repeats: false)
        }
    }
    
    @objc private func actionHideAlert() {
        timer?.invalidate()
        timer = nil
        
        let padding: CGFloat = self.padding
        
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn) {
                self?.transform = CGAffineTransform(translationX: 0, y: -padding)
            } completion: { finished in
                // Removing Banner alert after hidding it
                self?.removeFromSuperview()
            }
        }
    }
}
