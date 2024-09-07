//
//  FontCell.swift
//  UIConfigDemo
//
//  Created by Juan Jose Elias Navarro on 26/06/24.
//

import UIKit
import UIConfig

class FontCell: UITableViewCell {
    
    lazy var lblName: UILabel = {
        return UILabel(font: .subTitle)
    }()
    
    lazy var lblSubtitle: UILabel = {
        return UILabel(color: .textLight, font: .light, alignment: .right)
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
        
        contentView.addSubview(lblName)
        contentView.addSubview(lblSubtitle)
        
        NSLayoutConstraint.activate([
            lblName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .padding),
            lblName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .padding),
            lblName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: .padding(-1)),
            
            lblSubtitle.topAnchor.constraint(equalTo: lblName.topAnchor),
            lblSubtitle.bottomAnchor.constraint(equalTo: lblName.bottomAnchor),
            lblSubtitle.leadingAnchor.constraint(equalTo: lblName.trailingAnchor, constant: .padding(0.5)),
            lblSubtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: .padding(-1)),
        ])
    }
    
    func config(with item: FontItem) {
        lblName.text = item.rawValue.capitalized
        lblSubtitle.text = item.subtitle
    }

}
