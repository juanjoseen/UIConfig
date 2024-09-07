//
//  AxkanLoading.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 03/07/24.
//

import UIKit

class AxkanLoadingView: UIView {
    
    private let circleLayer: CAShapeLayer = CAShapeLayer()
    private let blurEffectView: UIVisualEffectView
    private let lineLayer1 = CAShapeLayer()
    private let lineLayer2 = CAShapeLayer()
    private let lineLayer3 = CAShapeLayer()
    private let lineLayer4 = CAShapeLayer()
    
    private let radius: CGFloat = 100
    
    init() {
        blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.tag = .LOADING_VIEW_TAG
        setupView()
        setupLayer()
        setupLines()
    }
    
    required init?(coder: NSCoder) {
        blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.tag = .LOADING_VIEW_TAG
        setupView()
        setupLayer()
        setupLines()
    }
    
    private func setupLines() {
        // Define el camino para las líneas que forman una "X"
        let centerX: CGFloat = screenWidth / 2.0
        let centerY: CGFloat = screenHeight / 3.0
        
        let maxY: CGFloat = centerY - radius * 0.5
        let minY: CGFloat = centerY + radius * 0.3
        
        let offset: CGFloat = radius * 0.25
        
        let minX: CGFloat = centerX - radius * 0.7
        let minX2: CGFloat = minX + offset
        let minX3: CGFloat = centerX - offset
        
        let maxX: CGFloat = centerX + radius * 0.7
        let maxX2: CGFloat = maxX - offset
        let maxX3: CGFloat = centerX + offset
        
        let linePath1 = UIBezierPath()
        linePath1.move(to: CGPoint(x: centerX, y: maxY))
        linePath1.addLine(to: CGPoint(x: minX, y: minY))
        
        let linePath2 = UIBezierPath()
        linePath2.move(to: CGPoint(x: maxX3, y: maxY))
        linePath2.addLine(to: CGPoint(x: minX2, y: minY))
        
        let linePath3 = UIBezierPath()
        linePath3.move(to: CGPoint(x: centerX, y: maxY))
        linePath3.addLine(to: CGPoint(x: maxX, y: minY))
        
        let linePath4 = UIBezierPath()
        linePath4.move(to: CGPoint(x: minX3, y: maxY))
        linePath4.addLine(to: CGPoint(x: maxX2, y: minY))
        
        // Configura la primera línea
        lineLayer1.path = linePath1.cgPath
        lineLayer1.fillColor = UIColor.clear.cgColor
        lineLayer1.strokeColor = UIColor.textColor.cgColor
        lineLayer1.lineCap = .round
        lineLayer1.lineWidth = 3
        
        // Configura la segunda línea
        lineLayer2.path = linePath2.cgPath
        lineLayer2.fillColor = UIColor.clear.cgColor
        lineLayer2.strokeColor = UIColor.textColor.cgColor
        lineLayer2.lineCap = .round
        lineLayer2.lineWidth = 3
        
        // Configura la tercera línea
        lineLayer3.path = linePath3.cgPath
        lineLayer3.fillColor = UIColor.clear.cgColor
        lineLayer3.strokeColor = UIColor.textColor.cgColor
        lineLayer3.lineCap = .round
        lineLayer3.lineWidth = 3
        
        // Configura la cuarta línea
        lineLayer4.path = linePath4.cgPath
        lineLayer4.fillColor = UIColor.clear.cgColor
        lineLayer4.strokeColor = UIColor.textColor.cgColor
        lineLayer4.lineCap = .round
        lineLayer4.lineWidth = 3
        
        layer.addSublayer(lineLayer1)
        layer.addSublayer(lineLayer2)
        layer.addSublayer(lineLayer3)
        layer.addSublayer(lineLayer4)
    }
    
    private func setupView() {
        blurEffectView.frame = bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(blurEffectView)
    }
    
    private func setupLayer() {
        self.backgroundColor = .clear
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: screenWidth / 2.0, y: screenHeight / 3.0), radius: radius, startAngle: 0.0, endAngle: CGFloat.pi * 2.0, clockwise: true)
        
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.textColor.cgColor
        circleLayer.lineWidth = 3.0;
        
        layer.addSublayer(circleLayer)
    }
    
    func startAnimating() {
        let drawAnimation = CABasicAnimation(keyPath: "strokeEnd")
        drawAnimation.fromValue = 0
        drawAnimation.toValue = 1
        drawAnimation.duration = 0.3
        
        let eraseAnimation = CABasicAnimation(keyPath: "strokeStart")
        eraseAnimation.fromValue = 0
        eraseAnimation.toValue = 1
        eraseAnimation.duration = 0.3
        eraseAnimation.beginTime = 0.9
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [drawAnimation, eraseAnimation]
        groupAnimation.duration = 1.2
        groupAnimation.repeatCount = .infinity
        
        circleLayer.add(groupAnimation, forKey: "loadingAnimation")
        lineLayer1.add(groupAnimation, forKey: "loadingAnimation")
        lineLayer2.add(groupAnimation, forKey: "loadingAnimation")
        lineLayer3.add(groupAnimation, forKey: "loadingAnimation")
        lineLayer4.add(groupAnimation, forKey: "loadingAnimation")
    }
    
    func stopAnimating() {
        circleLayer.removeAnimation(forKey: "loadingAnimation")
        lineLayer1.removeAnimation(forKey: "loadingAnimation")
        lineLayer2.removeAnimation(forKey: "loadingAnimation")
        lineLayer3.removeAnimation(forKey: "loadingAnimation")
        lineLayer4.removeAnimation(forKey: "loadingAnimation")
    }
}
