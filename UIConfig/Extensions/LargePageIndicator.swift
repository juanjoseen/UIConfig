//
//  LargePageIndicator.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 17/09/24.
//

import UIKit

public protocol LargePageIndicatorDelegate: AnyObject {
    func willIncreasePage(indicator: LargePageIndicator, by increment: Int)
    func willDecreasePage(indicator: LargePageIndicator, by decrement: Int)
    
    func didIncreasePage(indicator: LargePageIndicator, by increment: Int)
    func didDecreasePage(indicator: LargePageIndicator, by decrement: Int)
    
    func didReachLastPage(indicator: LargePageIndicator)
    func didReturnToFirstPage(indicator: LargePageIndicator)
}

public extension LargePageIndicatorDelegate {
    func willIncreasePage(indicator: LargePageIndicator, by increment: Int) {}
    func willDecreasePage(indicator: LargePageIndicator, by decrement: Int) {}
    
    func didIncreasePage(indicator: LargePageIndicator, by increment: Int) {}
    func didDecreasePage(indicator: LargePageIndicator, by decrement: Int) {}
    
    func didReachLastPage(indicator: LargePageIndicator) {}
    func didReturnToFirstPage(indicator: LargePageIndicator) {}
}

public class LargePageIndicator: UIView {
    
    private var numberOfPages: Int
    
    public var activePageColor: UIColor = .systemBlue {
        didSet {
            updatePages()
        }
    }
    
    public var inactivePageColor: UIColor = .placeholderText {
        didSet {
            updatePages()
        }
    }
    
    private var page: Int = 0
    
    public var currentPage: Int {
        get {
            return page
        }
    }
    
    public weak var delegate: LargePageIndicatorDelegate?
    
    private lazy var stackView: UIStackView = {
        let stack: UIStackView = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 6
        return stack
    }()
    
    public init(numberOfPages: Int) {
        self.numberOfPages = numberOfPages
        super.init(frame: .zero)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        self.numberOfPages = 0
        super.init(coder: coder)
        configUI()
    }
    
    private func configUI() {
        translatesAutoresizingMaskIntoConstraints = false
        
        let inactivePages: Int = numberOfPages - 1
        let totalWidth: CGFloat = CGFloat(inactivePages) * 20.0 + 64.0 + CGFloat(inactivePages) * 6
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: totalWidth),
        ])
        
        for i in 0..<numberOfPages {
            let isCurrentPage: Bool = currentPage == i
            let width: CGFloat = isCurrentPage ? 64 : 20
            let color: UIColor = isCurrentPage ? activePageColor : inactivePageColor
            
            let view: UIView = UIView(radius: 4, color: color)
            view.tag = i
            
            stackView.addArrangedSubview(view)
            
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: stackView.topAnchor),
                view.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
                view.widthAnchor.constraint(equalToConstant: width),
            ])
        }
    }
    
    private func updatePages() {
        for sub in stackView.arrangedSubviews {
            NSLayoutConstraint.deactivate(sub.constraints)
            sub.backgroundColor = inactivePageColor
        }
        
        for (index, sub) in stackView.arrangedSubviews.enumerated() {
            let isCurrentPage: Bool = currentPage == index
            let width: CGFloat = isCurrentPage ? 64 : 20
            let color: UIColor = isCurrentPage ? activePageColor : inactivePageColor
            
            sub.backgroundColor = color
            
            NSLayoutConstraint.activate([
                sub.topAnchor.constraint(equalTo: stackView.topAnchor),
                sub.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
                sub.widthAnchor.constraint(equalToConstant: width),
            ])
        }
        layoutIfNeeded()
    }
    
    public func increasePage(by increment: Int = 1) {
        delegate?.willIncreasePage(indicator: self, by: increment)
        
        page += max(1, increment)
        page = min(page, numberOfPages - 1)
        
        updatePages()
        
        if page == numberOfPages - 1 {
            delegate?.didReachLastPage(indicator: self)
        }
        
        delegate?.didIncreasePage(indicator: self, by: increment)
    }
    
    public func decreasePage(by decrement: Int = 1) {
        delegate?.willDecreasePage(indicator: self, by: decrement)
        
        page -= max(1, decrement)
        page = max(page, 0)
        
        updatePages()
        
        if page == 0 {
            delegate?.didReturnToFirstPage(indicator: self)
        }
        
        delegate?.didDecreasePage(indicator: self, by: decrement)
    }
}
