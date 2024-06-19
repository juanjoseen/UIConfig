//
//  DateFormatter.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 10/12/22.
//

import Foundation

public extension DateFormatter {
    static var full: DateFormatter {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_us")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        return dateFormatter
    }
    
    static var short: DateFormatter {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_us")
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter
    }
    
    static var standard: DateFormatter {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_us")
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        return dateFormatter
    }
    
    static var inverse: DateFormatter {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_us")
        dateFormatter.dateFormat = "yy/MM/dd HH:mm:ss"
        return dateFormatter
    }
}
