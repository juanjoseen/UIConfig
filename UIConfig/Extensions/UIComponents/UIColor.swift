//
//  UIColor.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 21/11/22.
//

import UIKit

public extension UIColor {
    static var titleColor: UIColor {
        return UIColor { (traits) -> UIColor in
            return traits.userInterfaceStyle == .dark ? .white : .black
        }
    }
    
    /// light: #1B1A28
    /// dark: #F1F1F1
    static var textColor: UIColor {
        return UIColor { (traits) -> UIColor in
            return traits.userInterfaceStyle == .dark ? UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00) : UIColor(red: 0.106, green: 0.102, blue: 0.157, alpha: 1)
        }
    }
    
    /// textColor with 75% alpha
    static var textLight: UIColor {
        return UIColor.textColor.withAlphaComponent(0.75)
    }
    
    /// light: #F1F1F1
    /// dark: #1B1A28
    static var bgColor: UIColor {
        return UIColor { (traits) -> UIColor in
            return traits.userInterfaceStyle == .dark ? UIColor(red: 0.13, green: 0.15, blue: 0.17, alpha: 1.00) : UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.00)
        }
    }
    
    static var success: UIColor {
        return UIColor(red: 0.26, green: 0.63, blue: 0.28, alpha: 1.00) // #43a047
    }
    
    static var failure: UIColor {
        return UIColor(red: 0.83, green: 0.18, blue: 0.18, alpha: 1.00) // #d32f2f
    }
    
    static var info: UIColor {
        return UIColor(red: 0.01, green: 0.66, blue: 0.96, alpha: 1.00) // #03a9f4
    }
    
    static var warning: UIColor {
        return UIColor(red: 1.00, green: 0.70, blue: 0.00, alpha: 1.00) // #ffb300 
    }
    
    static var lineColor: UIColor {
        return .textColor.withAlphaComponent(0.15)
    }
}
