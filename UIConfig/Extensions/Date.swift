//
//  Date.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 09/03/23.
//

import Foundation

public extension Date {
    func isSameDayAs(_ date: Date) -> Bool {
        let diff = Calendar.current.dateComponents([.day], from: self, to: date)
        return diff.day == 0
    }
    
    func isSameMonthAs(_ date: Date) -> Bool {
        let diff = Calendar.current.dateComponents([.month], from: self, to: date)
        return diff.day == 0
    }
    
    func isSameYearAs(_ date: Date) -> Bool {
        let diff = Calendar.current.dateComponents([.year], from: self, to: date)
        return diff.day == 0
    }
}
