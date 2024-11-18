//
//  UIFont.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 21/11/22.
//

import UIKit

public extension UIFont {
    static var largeTitle: UIFont = FontConfig.current.largeTitle
    static var title: UIFont      = FontConfig.current.title
    static var header: UIFont     = FontConfig.current.header
    static var subtitle: UIFont   = FontConfig.current.subtitle
    static var regular: UIFont    = FontConfig.current.regular
    static var light: UIFont      = FontConfig.current.light
    static var tiny: UIFont       = FontConfig.current.tiny
    
    static func title(_ size: CGFloat) -> UIFont {
        return FontConfig.current.bold(size)
    }
    
    static func subtitle(_ size: CGFloat) -> UIFont {
        return FontConfig.current.semiBold(size)
    }
    
    static func regular(_ size: CGFloat) -> UIFont {
        return FontConfig.current.regular(size)
    }
    
    static func light(_ size: CGFloat) -> UIFont {
        return FontConfig.current.light(size)
    }
    
}
