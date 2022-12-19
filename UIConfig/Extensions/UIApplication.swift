//
//  UIApplication.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 15/12/22.
//

import UIKit

public extension UIApplication {
    var mainWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
}
