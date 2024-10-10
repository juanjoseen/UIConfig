//
//  String.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 10/12/22.
//

import UIKit

public extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    
    func textWidth(for font: UIFont) -> CGFloat {
        return self.size(withAttributes: [.font: font]).width
    }
    
    func textHeight(for font: UIFont) -> CGFloat {
        return self.size(withAttributes: [.font: font]).height
    }
}
