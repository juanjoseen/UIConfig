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
            return [.title, .subtitle, .regular, .light]
        }
    }
}

enum FontItem: String {
    case avenir
    case baskerville
    case georgia
    case helvetica
    case verdana
    case title
    case subtitle
    case regular
    case light
    
    var subtitle: String? {
        switch self {
        case .avenir:
            return "(Default)"
        case .title:
            return "Avenir - bold - 25"
        case .subtitle:
            return "Avenir - medium - 17"
        case .regular:
            return "Avenir - regular - 15"
        case .light:
            return "Avenir - light - 13"
        default:
            return nil
        }
    }
}
