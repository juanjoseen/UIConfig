//
//  UIFont.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 21/11/22.
//

import UIKit

public extension UIFont {
    static var title: UIFont = Avenir.bold(25)
    static var subTitle: UIFont = Avenir.medium(17)
    static var regular: UIFont = Avenir.regular(15)
    static var light: UIFont = Avenir.light(13)
    
    static func title(_ size: CGFloat) -> UIFont {
        return Avenir.bold(size)
    }
    
    static func subTitle(_ size: CGFloat) -> UIFont {
        return Avenir.medium(size)
    }
    
    static func regular(_ size: CGFloat) -> UIFont {
        return Avenir.regular(size)
    }
    
    static func light(_ size: CGFloat) -> UIFont {
        return Avenir.light(size)
    }
    
}
