//
//  Lottie.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 10/12/22.
//

import Foundation
import Lottie

open class Lottie {
    public static var loading: AnimationView {
        get {
            let view: AnimationView = AnimationView(name: "axkan_loading", bundle: .local)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.contentMode = .scaleAspectFit
            view.backgroundColor = .clear
            view.animationSpeed = 1.0
            view.loopMode = .loop
            return view
        }
    }
}
