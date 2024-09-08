//
//  ItemCell.swift
//  UIConfigDemo
//
//  Created by Juan Jose Elias Navarro on 22/06/24.
//

import UIKit
import UIConfig

class ItemCell: UITableViewCell {
    
    lazy var lblTitle: UILabel = {
        return UILabel(color: .titleColor, font: .subtitle)
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        selectionStyle = .none
        accessoryType = .disclosureIndicator
        
        contentView.addSubview(lblTitle)
        
        NSLayoutConstraint.activate([
            lblTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .padding),
            lblTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .padding),
            lblTitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: .padding(-1)),
            lblTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: .padding(-1))
        ])
    }
    
    func config(with title: String) {
        lblTitle.text = title
    }

}
