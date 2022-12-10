//
//  DateFormatter.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 10/12/22.
//

import Foundation

public extension DateFormatter {
    static var standard: DateFormatter {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_us")
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        return dateFormatter
    }
}
