//
//  RadiusSelection.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 22/03/23.
//

import UIKit

open class SelectionItem {
    open var title: String
    open var icon: Icon?
    open var subTitle: String?
    var isSelected: Bool = false
    
    public init(title: String, subTitle: String? = nil, icon: Icon? = nil) {
        self.icon = icon
        self.title = title
        self.subTitle = subTitle
    }
}

public protocol RadiusDelegate: AnyObject {
    func didCancel(selection: RadiusSelection)
    func didSelect(item: SelectionItem, on selection: RadiusSelection)
}

open class RadiusSelection: UIViewController {
    
    open var items: [SelectionItem]!
    open var titleMessage: String!
    open var color: UIColor!
    open var tag: Int = 0
    
    var message: String?
    var acceptTitle: String!
    
    private var MAX_TABLE_HEIGHT: CGFloat {
        let total: CGFloat = view.screenHeight
        let msgHeight: CGFloat = message?.textHeight(for: .regular) ?? 0
        return total - (300 + msgHeight)
    }
    
    public weak var delegate: RadiusDelegate?
    
    private lazy var bgView: UIView = {
        let view: UIView = UIView(radius: 40, color: .systemBackground)
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let table: UITableView = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        table.delegate = self
        table.dataSource = self
        table.isScrollEnabled = false
        table.registerCell(type: RadiusCell.self)
        return table
    }()
    
    public convenience init(with items: [SelectionItem], title: String, message: String? = nil, acceptTitle: String = "Accept", color: UIColor = .systemBlue) {
        self.init()
        self.color = color
        self.items = items
        self.message = message
        self.titleMessage = title
        self.acceptTitle = acceptTitle
        self.modalPresentationStyle = .overCurrentContext
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configUI()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hideView(animated: false)
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showView()
    }
    
    private func configUI() {
        view.backgroundColor = .clear
        
        let blurView: UIVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        blurView.translatesAutoresizingMaskIntoConstraints = false
        
        let btnAccept: UIButton = UIButton(title: acceptTitle, color: .white, bgColor: color, radius: .buttonRadius)
        btnAccept.titleLabel?.font = .subtitle(20)
        btnAccept.addTarget(self, action: #selector(actionAccept), for: .touchUpInside)
        
        let lblTitle: UILabel = UILabel(text: titleMessage, font: .subtitle(20), alignment: .center)
        let lblMessage: UILabel = UILabel(text: message, font: .regular)
        
        let tableHeight: CGFloat = heightForTable() + 8.0
        
        blurView.contentView.addSubview(bgView)
        bgView.addSubview(btnAccept)
        bgView.addSubview(tableView)
        bgView.addSubview(lblTitle)
        
        view.addSubview(blurView)
        
        NSLayoutConstraint.activate([
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            bgView.bottomAnchor.constraint(equalTo: blurView.bottomAnchor),
            bgView.leadingAnchor.constraint(equalTo: blurView.leadingAnchor),
            bgView.trailingAnchor.constraint(equalTo: blurView.trailingAnchor),
            bgView.topAnchor.constraint(equalTo: lblTitle.topAnchor, constant: .padding(-1.5)),
            
            btnAccept.heightAnchor.constraint(equalToConstant: .buttonHeight),
            btnAccept.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: .padding(1.5)),
            btnAccept.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: .padding(-1.5)),
            btnAccept.bottomAnchor.constraint(equalTo: blurView.safeAreaLayoutGuide.bottomAnchor, constant: .padding(-1)),
            
            tableView.heightAnchor.constraint(equalToConstant: tableHeight),
            tableView.leadingAnchor.constraint(equalTo: bgView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: bgView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: btnAccept.topAnchor, constant: .padding(-1.5)),
        ])
        
        if message != nil {
            bgView.addSubview(lblMessage)
            
            NSLayoutConstraint.activate([
                lblMessage.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: .padding),
                lblMessage.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: .padding(-1)),
                lblMessage.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: .padding(-1)),
                
                lblTitle.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: .padding),
                lblTitle.bottomAnchor.constraint(equalTo: lblMessage.topAnchor, constant: .padding(-1.5)),
                lblTitle.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: .padding(-1)),
            ])
        } else {
            NSLayoutConstraint.activate([
                lblTitle.leadingAnchor.constraint(equalTo: bgView.leadingAnchor, constant: .padding),
                lblTitle.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: .padding(-2)),
                lblTitle.trailingAnchor.constraint(equalTo: bgView.trailingAnchor, constant: .padding(-1)),
            ])
        }
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        actionCancel()
    }
    
    open func selectIndex(_ index: Int) {
        for i in 0..<items.count {
            let indexPath: IndexPath = IndexPath(row: i, section: 0)
            if index == i {
                tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none)
            } else {
                tableView.deselectRow(at: indexPath, animated: true)
            }
        }
    }
    
    private func hideView(animated: Bool = true, completion: (() -> Void)? = nil) {
        let height: CGFloat = view.screenHeight
        let translate: CGAffineTransform = CGAffineTransform(translationX: 0, y: height)
        if animated {
            UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseIn) {
                self.bgView.transform = translate
            } completion: { finished in
                completion?()
            }
        } else {
            bgView.transform = translate
            completion?()
        }
    }
    
    func showView() {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: .curveEaseOut) {
            self.bgView.transform = .identity
        }
    }
    
    @objc private func actionAccept() {
        hideView {
            self.dismiss(animated: false) {
                if let item: SelectionItem = self.items.first(where: { $0.isSelected }) {
                    self.delegate?.didSelect(item: item, on: self)
                } else {
                    self.delegate?.didCancel(selection: self)
                }
            }
        }
    }
    
    @objc private func actionCancel() {
        hideView {
            self.dismiss(animated: false) {
                self.delegate?.didCancel(selection: self)
            }
        }
    }
}

extension RadiusSelection: UITableViewDelegate, UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: RadiusCell = tableView.dequeueCell(withType: RadiusCell.self, for: indexPath) as? RadiusCell else {
            return UITableViewCell()
        }
        let item: SelectionItem = itemFor(indexPath)
        cell.config(with: item, color: color)
        return cell
    }
    
    private func itemFor(_ indexPath: IndexPath) -> SelectionItem {
        return items[indexPath.row]
    }
    
    private func heitghForItem(_ item: SelectionItem) -> CGFloat {
        return item.subTitle != nil ? 80.0 : 56.0
    }
    
    private func heightForTable() -> CGFloat {
        var sum: CGFloat = 0
        for item in self.items {
            sum += heitghForItem(item)
        }
        
        tableView.isScrollEnabled = sum >= MAX_TABLE_HEIGHT
        return min(sum, MAX_TABLE_HEIGHT)
    }
}
