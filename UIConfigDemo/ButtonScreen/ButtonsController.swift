//
//  ButtonsController.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 08/09/24.
//  
//
import UIKit

class ButtonsController: UIViewController {
    weak var viewButtons: ButtonsView?

    override func loadView() {
        let viewButtons: ButtonsView = ButtonsView(controller: self)
        self.viewButtons = viewButtons
        view = viewButtons
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Buttons"
    }
}
