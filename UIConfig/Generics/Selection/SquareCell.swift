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
        return button
    }()
    
    lazy var lblTitle: UILabel = {
        return UILabel(font: .subTitle(20))
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
            btnSelection.widthAnchor.constraint(equalToConstant: 24),
            btnSelection.centerYAnchor.constraint(equalTo: centerYAnchor),
            btnSelection.heightAnchor.constraint(equalTo: btnSelection.widthAnchor),
            btnSelection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: .inversePadding),
            
            lblTitle.heightAnchor.constraint(equalToConstant: 24),
            lblTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            lblTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: .padding),
            lblTitle.trailingAnchor.constraint(equalTo: btnSelection.leadingAnchor, constant: .inversePadding),
            
            lblSubtitle.topAnchor.constraint(equalTo: lblTitle.bottomAnchor),
            lblSubtitle.leadingAnchor.constraint(equalTo: lblTitle.leadingAnchor),
            lblSubtitle.trailingAnchor.constraint(equalTo: lblTitle.trailingAnchor),
            lblSubtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
    }
    
    func config(with item: SelectionItem, color: UIColor = .systemBlue) {
        lblTitle.text = item.title
        lblSubtitle.text = item.subTitle
        self.item = item
        self.color = color
    }
    
    func toggleSelection() {
        item.isSelected.toggle()
        didSelect(item.isSelected)
    }
    
    func didSelect(_ selected: Bool) {
        item.isSelected = selected
        btnSelection.isSelected = selected
        btnSelection.tintColor = selected ? color : .textLight
    }

}
