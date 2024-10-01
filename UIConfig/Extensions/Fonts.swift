//
//  Fonts.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 21/11/22.
//

import UIKit

public protocol FontType {
    
    var fontName: String { get }
    
    /// default value: Bold - 30
    var largeTitle: UIFont { get }
    
    /// default value: Bold 25
    var title: UIFont { get }
    
    /// default value: semiBold 20
    var header: UIFont { get }
    
    /// default value: semiBold 17
    var subtitle: UIFont { get }
    
    /// default value: regular 15
    var regular: UIFont { get }
    
    /// default value: light 13
    var light: UIFont { get }
    
    /// default value: light 11
    var tiny: UIFont { get }
    
    func bold(_ size: CGFloat) -> UIFont
    func boldItalic(_ size: CGFloat) -> UIFont
    
    func semiBold(_ size: CGFloat) -> UIFont
    func semiBoldItalic(_ size: CGFloat) -> UIFont
    
    func regular(_ size: CGFloat) -> UIFont
    func italic(_ size: CGFloat) -> UIFont
    
    func light(_ size: CGFloat) -> UIFont
    func lightItalic(_ size: CGFloat) -> UIFont
}

extension FontType {
    
    /// default value: Bold - 30
    public var largeTitle: UIFont {
        get {
            return bold(30)
        }
    }
    
    /// default value: Bold 25
    public var title: UIFont {
        get {
            return bold(25)
        }
    }
    
    /// default value: semiBold 20
    public var header: UIFont {
        get {
            return semiBold(20)
        }
    }
    
    /// default value: semiBold 17
    public var subtitle: UIFont {
        get {
            return semiBold(17)
        }
    }
    
    /// default value: regular 15
    public var regular: UIFont {
        get {
            return regular(15)
        }
    }
    
    /// default value: light 13
    public var light: UIFont {
        get {
            return light(13)
        }
    }
    
    /// default value: light 11
    public var tiny: UIFont {
        get {
            return light(11)
        }
    }
}

open class Avenir: FontType {
    
    private init() {}
    public static let instance: Avenir = Avenir()
    
    public var fontName: String = "Avenir"
    
    public func regular(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Book", size: size)!
    }

    public func light(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Light", size: size)!
    }
    
    public func italic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-BookOblique", size: size)!
    }

    public func lightItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-LightOblique", size: size)!
    }

    public func bold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Heavy", size: size)!
    }
    
    public func boldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-HeavyOblique", size: size)!
    }
    
    public func semiBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Medium", size: size)!
    }
    
    public func semiBoldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Avenir-MediumOblique", size: size)!
    }
}

open class Baskerville: FontType {
    
    private init() {}
    public static let instance: Baskerville = Baskerville()
    
    public var fontName: String = "Baskerville"
    
    public func regular(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Baskerville", size: size)!
    }
    
    public func italic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Baskerville-Italic", size: size)!
    }
    
    public func semiBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Baskerville-SemiBold", size: size)!
    }
    
    public func semiBoldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Baskerville-SemiBoldItalic", size: size)!
    }
    
    public func bold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Baskerville-Bold", size: size)!
    }
    
    public func boldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Baskerville-BoldItalic", size: size)!
    }
    
    public func light(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Baskerville", size: size)!
    }
    
    public func lightItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Baskerville-Italic", size: size)!
    }
}

open class Georgia: FontType {
    
    private init() {}
    public static let instance: Georgia = Georgia()
    
    public var fontName: String = "Georgia"
    
    public func semiBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Georgia-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    public func semiBoldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Georgia-Italic", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
    
    public func regular(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Georgia", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public func italic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Georgia-Italic", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
    
    public func bold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Georgia-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    public func boldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Georgia-BoldItalic", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
    
    public func light(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Georgia", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public func lightItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Georgia-Italic", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
}

open class Helvetica: FontType {
    
    private init() {}
    public static let instance: Helvetica = Helvetica()
    
    public var fontName: String = "Helvetica"
    
    public func regular(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public func italic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica-Oblique", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
    
    public func bold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    public func boldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica-BoldOblique", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
    
    public func light(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica-Light", size: size) ?? UIFont.systemFont(ofSize: size, weight: .light)
    }
    
    public func semiBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    public func semiBoldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica-BoldOblique", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
    
    public func lightItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica-LightOblique", size: size) ?? UIFont.systemFont(ofSize: size, weight: .light)
    }
}

open class Verdana: FontType {
    
    private init() {}
    public static let instance: Verdana = Verdana()
    
    public var fontName: String = "Verdana"
    
    public func regular(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Verdana", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public func italic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Verdana-Italic", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
    
    public func bold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Verdana-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    public func boldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Verdana-BoldItalic", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
    
    public func semiBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Verdana-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    public func semiBoldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Verdana-BoldItalic", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
    
    public func light(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Verdana", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public func lightItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Verdana-Italic", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
}


public struct FontConfig {
    public static var current: FontType = Avenir.instance
}
