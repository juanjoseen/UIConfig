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
    
    static var textColor: UIColor {
        return UIColor { (traits) -> UIColor in
            return traits.userInterfaceStyle == .dark ? UIColor(red: 0.969, green: 0.973, blue: 0.980, alpha: 1) : UIColor(red: 0.106, green: 0.102, blue: 0.157, alpha: 1)
        }
    }
    
    static var textLight: UIColor {
        return UIColor.textColor.withAlphaComponent(0.75)
    }
    
    static var bgColor: UIColor {
        return UIColor { (traits) -> UIColor in
            return traits.userInterfaceStyle == .dark ? UIColor(red: 0.05, green: 0.07, blue: 0.12, alpha: 1.00) : UIColor(red: 0.97, green: 0.97, blue: 0.98, alpha: 1.00)
        }
    }
}