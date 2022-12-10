//
//  Fonts.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 21/11/22.
//

import UIKit

open class Georgia {
    public static func regular(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Georgia", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public static func italic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Georgia-Italic", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
    
    public static func bold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Georgia-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    public static func boldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Georgia-BoldItalic", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
}

open class Helvetica {
    public static func regular(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public static func italic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica-Oblique", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
    
    public static func bold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    public static func boldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica-BoldOblique", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
    
    public static func light(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Helvetica-Light", size: size) ?? UIFont.systemFont(ofSize: size, weight: .light)
    }
}

open class Verdana {
    public static func regular(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Verdana", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    public static func italic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Verdana-Italic", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
    
    public static func bold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Verdana-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    public static func boldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Verdana-BoldItalic", size: size) ?? UIFont.italicSystemFont(ofSize: size)
    }
}

open class Avenir {
    public static func regular(_ size:CGFloat) -> UIFont {
        return UIFont(name: "Avenir", size: size)!
    }

    public static func light(_ size:CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Light", size: size)!
    }

    public static func lightItalic(_ size:CGFloat) -> UIFont {
        return UIFont(name: "Avenir-LightOblique", size: size)!
    }

    public static func medium(_ size:CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Medium", size: size)!
    }

    public static func bold(_ size:CGFloat) -> UIFont {
        return UIFont(name: "Avenir-Heavy", size: size)!
    }
}

open class Baskerville {
    public static func regular(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Baskerville", size: size)!
    }
    
    public static func italic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Baskerville-Italic", size: size)!
    }
    
    public static func semiBold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Baskerville-SemiBold", size: size)!
    }
    
    public static func semiBoldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Baskerville-SemiBoldItalic", size: size)!
    }
    
    public static func bold(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Baskerville-Bold", size: size)!
    }
    
    public static func boldItalic(_ size: CGFloat) -> UIFont {
        return UIFont(name: "Baskerville-BoldItalic", size: size)!
    }
}
