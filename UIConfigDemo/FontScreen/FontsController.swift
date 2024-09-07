//
//  FontsController.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 26/06/24.
//  
//
import UIKit

class FontsController: UIViewController {
    weak var viewFonts: FontsView?

    override func loadView() {
        let viewFonts: FontsView = FontsView(controller: self)
        self.viewFonts = viewFonts
        view = viewFonts
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Fonts"
    }
}
