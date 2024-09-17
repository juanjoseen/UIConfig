//
//  ShowIndicatorDemo.swift
//  UIConfigDemo
//
//  Created by Juan Jose Elias Navarro on 17/09/24.
//

import UIKit
import UIConfig

class ShowIndicatorDemo: UIViewController {
    
    lazy var indicator: LargePageIndicator = {
        let page: LargePageIndicator = LargePageIndicator(numberOfPages: 6)
        page.delegate = self
        return page
    }()
    
    lazy var lblPage: UILabel = {
        return UILabel(text: "Current page: 0", color: .titleColor, font: .title)
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configUI()
    }
    
    private func configUI() {
        view.backgroundColor = .bgColor
        
        let lblIncrease: UILabel = UILabel(text: "Touch once to increase the page", font: .subtitle)
        let lblDecrease: UILabel = UILabel(text: "Touch with two fingers to decrease the page", font: .subtitle)
        
        view.addSubview(indicator)
        view.addSubview(lblIncrease)
        view.addSubview(lblDecrease)
        view.addSubview(lblPage)
        
        let touch: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(actionIncreasePage))
        touch.numberOfTapsRequired = 1
        touch.numberOfTouchesRequired = 1
        
        let doubleTouch: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(actionDecreasePage))
        doubleTouch.numberOfTapsRequired = 1
        doubleTouch.numberOfTouchesRequired = 2
        
        view.addGestureRecognizer(touch)
        view.addGestureRecognizer(doubleTouch)
        
        NSLayoutConstraint.activate([
            
            lblIncrease.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: .padding(2)),
            lblIncrease.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .padding),
            lblIncrease.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: .padding(-1)),
            
            lblDecrease.leadingAnchor.constraint(equalTo: lblIncrease.leadingAnchor),
            lblDecrease.trailingAnchor.constraint(equalTo: lblIncrease.trailingAnchor),
            lblDecrease.topAnchor.constraint(equalTo: lblIncrease.bottomAnchor, constant: .padding(2)),
            
            lblPage.leadingAnchor.constraint(equalTo: lblDecrease.leadingAnchor),
            lblPage.trailingAnchor.constraint(equalTo: lblDecrease.trailingAnchor),
            lblPage.topAnchor.constraint(equalTo: lblDecrease.bottomAnchor, constant: .padding(3)),
            
            indicator.heightAnchor.constraint(equalToConstant: 8),
            indicator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .padding(3)),
            indicator.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: .padding(-2)),
            indicator.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: .padding(-3)),
        ])
    }
    
    @objc func actionIncreasePage() {
        indicator.increasePage()
    }
    
    @objc func actionDecreasePage() {
        indicator.decreasePage()
    }
}

extension ShowIndicatorDemo: LargePageIndicatorDelegate {
    func didIncreasePage(indicator: LargePageIndicator, by increment: Int) {
        lblPage.text = "Current page: \(indicator.currentPage)"
    }
    
    func didDecreasePage(indicator: LargePageIndicator, by decrement: Int) {
        lblPage.text = "Current page: \(indicator.currentPage)"
    }
    
    func didReachLastPage(indicator: LargePageIndicator) {
        let alert: UIAlertController = UIAlertController(title: "Reached last page", message: "The current page won't increase even if you continue increasing the page", preferredStyle: .alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
    
    func didReturnToFirstPage(indicator: LargePageIndicator) {
        let alert: UIAlertController = UIAlertController(title: "Returned to the first page", message: "The current page won't decrease even if you continue decreasing the page", preferredStyle: .alert)
        
        let okAction: UIAlertAction = UIAlertAction(title: "Ok", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}
