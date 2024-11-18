//
//  RadiusCell.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 22/03/23.
//

import UIKit

class RadiusCell: UITableViewCell {
    
    lazy var btnSelection: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = false
        return button
    }()
    
    lazy var lblTitle: UILabel = {
        return UILabel(font: .subtitle(20))
    }()
    
    lazy var lblSubtitle: UILabel = {
        let label: UILabel = UILabel(color: .textLight, font: .light(11))
        label.numberOfLines = 2
        return label
    }()
    
    private var color: UIColor!
    private var item: SelectionItem!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .clear
        selectionStyle = .none
        
        contentView.addSubview(btnSelection)
        contentView.addSubview(lblTitle)
        contentView.addSubview(lblSubtitle)
        
        NSLayoutConstraint.activate([
            btnSelection.widthAnchor.constraint(equalToConstant: .padding(1.5)),
            btnSelection.centerYAnchor.constraint(equalTo: centerYAnchor),
            btnSelection.heightAnchor.constraint(equalTo: btnSelection.widthAnchor),
            btnSelection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .padding(-1)),
            
            lblTitle.heightAnchor.constraint(equalToConstant: .padding(1.5)),
            lblTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: .padding),
            lblTitle.trailingAnchor.constraint(equalTo: btnSelection.leadingAnchor, constant: .padding(-1)),
            
            lblSubtitle.topAnchor.constraint(equalTo: lblTitle.bottomAnchor),
            lblSubtitle.leadingAnchor.constraint(equalTo: lblTitle.leadingAnchor),
            lblSubtitle.trailingAnchor.constraint(equalTo: lblTitle.trailingAnchor),
            lblSubtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: .padding(-1)),
        ])
    }
    
    func config(with item: SelectionItem, color: UIColor = .systemBlue) {
        lblSubtitle.text = item.subTitle
        lblTitle.text = item.title
        self.color = color
        self.item = item
        self.btnSelection.tintColor = color
        if let icon: Icon = item.icon {
            
            let imgIcon: UIImageView = UIImageView(name: icon.name, isSystem: icon.isSystemImage, size: 24, tint: color)
            imgIcon.contentMode = .scaleAspectFit
            
            contentView.addSubview(imgIcon)
            
            NSLayoutConstraint.activate([
                imgIcon.widthAnchor.constraint(equalToConstant: 32),
                imgIcon.heightAnchor.constraint(equalTo: imgIcon.widthAnchor),
                imgIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                imgIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .padding),
                lblTitle.leadingAnchor.constraint(equalTo: imgIcon.trailingAnchor, constant: .padding(0.5)),
            ])
        } else {
            lblTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .padding).isActive = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        item.isSelected = selected
        if selected {
            btnSelection.setImage(UIImage.system(named: "checkmark", size: 24), for: .normal)
        } else {
            btnSelection.setImage(nil, for: .normal)
        }
    }
}
