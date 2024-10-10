//
//  SquareCell.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 23/03/23.
//

import UIKit

class SquareCell: UITableViewCell {

    lazy var btnSelection: UIButton = {
        let button: UIButton = UIButton(image: "square", isSystem: true, size: 24, color: .textLight)
        button.setImage(UIImage.system(named: "checkmark.square.fill", size: 24), for: .selected)
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
    
    lazy var imgIcon: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
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
            btnSelection.widthAnchor.constraint(equalToConstant: 24),
            btnSelection.heightAnchor.constraint(equalToConstant: 22),
            btnSelection.centerYAnchor.constraint(equalTo: centerYAnchor),
            btnSelection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .padding(-1)),
            
            lblTitle.heightAnchor.constraint(equalToConstant: 24),
            lblTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            lblTitle.trailingAnchor.constraint(equalTo: btnSelection.leadingAnchor, constant: .padding(-1)),
            
            lblSubtitle.topAnchor.constraint(equalTo: lblTitle.bottomAnchor),
            lblSubtitle.leadingAnchor.constraint(equalTo: lblTitle.leadingAnchor),
            lblSubtitle.trailingAnchor.constraint(equalTo: lblTitle.trailingAnchor),
            lblSubtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
    
    func config(with item: SelectionItem, color: UIColor = .systemBlue, isSelected: Bool, isEnabled: Bool) {
        self.item = item
        self.color = color
        lblTitle.text = item.title
        lblSubtitle.text = item.subTitle
        
        if let icon: Icon = item.icon {
            imgIcon.image = icon.image
            imgIcon.tintColor = color
            
            contentView.addSubview(imgIcon)
            
            NSLayoutConstraint.activate([
                imgIcon.widthAnchor.constraint(equalToConstant: 24),
                imgIcon.heightAnchor.constraint(equalTo: imgIcon.widthAnchor),
                imgIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                imgIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .padding),
                lblTitle.leadingAnchor.constraint(equalTo: imgIcon.trailingAnchor, constant: .padding(0.5)),
            ])
        } else {
            lblTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .padding).isActive = true
        }
        
        didSelect(isSelected)
        enable(isEnabled)
    }
    
    private func toggleSelection() {
        item.isSelected.toggle()
        didSelect(item.isSelected)
    }
    
    private func didSelect(_ selected: Bool) {
        item.isSelected = selected
        btnSelection.isSelected = selected
        btnSelection.tintColor = selected ? color : .textLight
    }
    
    private func enable(_ enabled: Bool) {
        let items: [UIView] = [imgIcon, lblTitle, lblSubtitle, btnSelection]
        if enabled {
            items.forEach({ $0.alpha = 1.0 })
            isUserInteractionEnabled = true
        } else {
            items.forEach({ $0.alpha = 0.25 })
            isUserInteractionEnabled = false
        }
    }

}
