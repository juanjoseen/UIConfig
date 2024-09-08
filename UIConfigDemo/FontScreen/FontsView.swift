//
//  FontsView.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 26/06/24.
//  
//
import UIKit
import UIConfig

class FontsView: UIView {
    unowned var controller: FontsController!
    
    var sections: [FontSections] = FontSections.allCases
    
    lazy var tableView: UITableView = {
        let table: UITableView = UITableView(frame: .zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .bgColor
        table.delegate = self
        table.dataSource = self
        
        table.registerCell(type: FontCell.self)
        return table
    }()

    init(controller: FontsController) {
        self.controller = controller
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        backgroundColor = .bgColor
        
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

extension FontsView: UITableViewDelegate, UITableViewDataSource {
    func itemFor(_ indexPath: IndexPath) -> FontItem {
        return sections[indexPath.section].items[indexPath.row]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: FontCell = tableView.dequeueCell(withType: FontCell.self, for: indexPath) as? FontCell {
            let item: FontItem = itemFor(indexPath)
            cell.config(with: item)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
}

enum FontSections: CaseIterable {
    case names
    case sizes
    
    var title: String {
        switch self {
        case .names:
            return "Names"
        case .sizes:
            return "Sizes"
        }
    }
    
    var items: [FontItem] {
        switch self {
        case .names:
            return [.avenir, .baskerville, .georgia, .helvetica, .verdana]
        case .sizes:
            return [.largeTitle, .title, .header, .subtitle, .regular, .light, .tiny]
        }
    }
}

enum FontItem: String {
    case avenir
    case baskerville
    case georgia
    case helvetica
    case verdana
    case largeTitle = "Large Title"
    case title
    case header
    case subtitle
    case regular
    case light
    case tiny
    
    var subtitle: String? {
        
        let font: FontType = FontConfig.current
        
        switch self {
        case .avenir:
            return "(Default)"
        case .largeTitle:
            return "\(font.fontName) - bold - 30"
        case .title:
            return "\(font.fontName) - bold - 25"
        case .header:
            return "\(font.fontName) - medium - 20"
        case .subtitle:
            return "\(font.fontName) - medium - 17"
        case .regular:
            return "\(font.fontName) - regular - 15"
        case .light:
            return "\(font.fontName) - light - 13"
        case .tiny:
            return "\(font.fontName) - light - 11"
        default:
            return nil
        }
    }
}
