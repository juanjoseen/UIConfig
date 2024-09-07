//
//  LoadingController.swift
//  UIConfigDemo
//
//  Created by Juan Jose Elias Navarro on 03/07/24.
//

import UIKit
import UIConfig

class LoadingController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.showLoading()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.hideLoading()
        }
    }

    private func configUI() {
        view.backgroundColor = .bgColor
        
        let text: String = "As well as blurring content, Apple also lets you add a \"vibrancy\" effect to your views – this is a translucency effect designed to ensure that text is readable when it's over any kind of blurred background, and it's used to create that soft glow effect you see in the notification center.\n\nWe could extend the previous example so that it adds a segmented control in the middle of the view, using a vibrancy effect. This is accomplished by created a second UIVisualEffectView inside the first one, this time using UIVibrancyEffect to create the glow. Note that you need to use the same blur type for both your visual effect views, otherwise the glow effect will be incorrect."
        
        let lblTitle: UILabel = UILabel(text: "Title", font: .title, alignment: .center)
        
        let lblText: UILabel = UILabel(text: text, color: .success, font: .title(15), alignment: .justified)
        
        view.addSubview(lblTitle)
        view.addSubview(lblText)
        
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: safeArea.topAnchor),
            lblTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .padding),
            lblTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: .padding(-1)),
            
            lblText.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: .padding(3)),
            lblText.leadingAnchor.constraint(equalTo: lblTitle.leadingAnchor),
            lblText.trailingAnchor.constraint(equalTo: lblTitle.trailingAnchor),
        ])
    }
}
