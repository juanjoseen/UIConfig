//
//  ViewController.swift
//  UIConfigDemo
//
//  Created by Juan Jose Elias Navarro on 22/06/24.
//

import UIKit
import UIConfig

class ViewController: UIViewController {
    
    var sections: [TableSection] = TableSection.allCases
    
    lazy var tableView: UITableView = {
        let table: UITableView = UITableView(frame: .zero, style: .insetGrouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .bgColor
        table.delegate = self
        table.dataSource = self
        table.registerCell(type: ItemCell.self)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configUI()
    }

    private func configUI() {
        title = "UIConfig Demo"
        view.backgroundColor = .bgColor
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
        ])
    }
    
    func showSuccessAlert() {
        let alert: GenericAlert = GenericAlert(alertTitle: "Success!!", message: "Success message for the alert, the text can grow as it need", okTitle: "Accept", type: .success, color: .success)
        present(alert, animated: false)
    }
    
    func showWarningAlert() {
        let alert: GenericAlert = GenericAlert(alertTitle: "Warning!!", message: "Warning message for the alert, the text can grow as it need", okTitle: "Accept", type: .warning, color: .warning)
        present(alert, animated: false)
    }
    
    func showErrorAlert() {
        let alert: GenericAlert = GenericAlert(alertTitle: "Error!!", message: "Error message for the alert, the text can grow as it need", okTitle: "accept", type: .error, color: .failure)
        present(alert, animated: false)
    }
    
    func showMultipleSelection() {
        var items: [SelectionItem] = []
        for i in 0...20 {
            items.append(SelectionItem(title: String(format: "Option %d", i), icon: Icon(name: "document", isSystemImage: true)))
        }
        let multipleSelection: MultipleSelection = MultipleSelection(with: items, title: "Multiple Selection", message: "You must select at least one option and a maximum of 5.")
        multipleSelection.minItemSelection = 1
        multipleSelection.maxItemSelection = 5
        multipleSelection.delegate = self
        present(multipleSelection, animated: false) {
            multipleSelection.selectIndexes([1, 3, 4, 7])
        }
    }
    
    func showSimpleSelection() {
        var items: [SelectionItem] = []
        for i in 0...20 {
            items.append(SelectionItem(title: String(format: "Option %d", i), subTitle: "subtitle \(i)", icon: Icon(name: "folder", isSystemImage: true)))
        }
        let simpleSelection: RadiusSelection = RadiusSelection(with: items, title: "Single Selection", message: "You must select only one option!", color: .systemGreen)
        present(simpleSelection, animated: false)
    }

    func showFonts() {
        pushVC(FontsController())
    }
    
    func showButtons() {
        pushVC(ButtonsController())
    }
    
    func showLoadingAnimation() {
        pushVC(LoadingController())
    }
    
    func showPageIndicator() {
        pushVC(ShowIndicatorDemo())
    }
    
    func showSuccessBannerAlert() {
        showSuccessBannerAlert(title: "This is a success banner alert message") {
            let alert: UIAlertController = UIAlertController(title: "Success!", message: "You tapped into the success banner alert", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    func showInfoBannerAlert() {
        showInfoBannerAlert(title: "This is an info banner alert message") {
            let alert: UIAlertController = UIAlertController(title: "Info!", message: "You tapped into the info banner alert", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    func showWarningBannerAlert() {
        showWarningBannerAlert(title: "This is a warning banner alert message!") {
            let alert: UIAlertController = UIAlertController(title: "Warning!", message: "You tapped into the warning banner alert", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    func showErrorBannerAlert() {
        showErrorBannerAlert(title: "This is an error banner alert message!") {
            let alert: UIAlertController = UIAlertController(title: "Error!", message: "You tapped into the error banner alert", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
        }
    }
    
    func showCustomBannerAlert() {
        let icon: Icon = Icon(name: "bookmark.fill", isSystemImage: true)
        let bannerAlert: BannerAlert = BannerAlert(title: "This banner won't hide automatically", icon: icon, color: .systemPurple, titleColor: .white) {
            let alert: UIAlertController = UIAlertController(title: "Alert", message: "You tapped into the custom banner alert", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(alert, animated: true)
        }
        bannerAlert.autoHide = false
        bannerAlert.show(in: self.view)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func itemFor(_ indexPath: IndexPath) -> TableItem {
        return sections[indexPath.section].items[indexPath.row]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section: TableSection = sections[section]
        return section.items.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section: TableSection = sections[section]
        return section.rawValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell: ItemCell = tableView.dequeueCell(withType: ItemCell.self, for: indexPath) {
            let item: TableItem = itemFor(indexPath)
            cell.config(with: item.rawValue)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item: TableItem = itemFor(indexPath)
        switch item {
        case .fonts:
            showFonts()
        case .buttons:
            showButtons()
        case .multipleSelection:
            showMultipleSelection()
        case .singleSelection:
            showSimpleSelection()
        case .successAlert:
            showSuccessAlert()
        case .warningAlert:
            showWarningAlert()
        case .errorAlert:
            showErrorAlert()
        case .loadingAnimation:
            showLoadingAnimation()
        case .pageIndicator:
            showPageIndicator()
        case .successBannerAlert:
            showSuccessBannerAlert()
        case .infoBannerAlert:
            showInfoBannerAlert()
        case .warningBannerAlert:
            showWarningBannerAlert()
        case .errorBannerAlert:
            showErrorBannerAlert()
        case .customBannerAlert:
            showCustomBannerAlert()
        default:
            return
        }
    }
}

extension ViewController: MultipleSelectionDelegate {
    func didCancel(selection: MultipleSelection) {
        print("canceled selection!!")
    }
    
    func didSelect(items: [SelectionItem], on selection: MultipleSelection) {
        print("items selected: \(items.map({ $0.title }).joined(separator: ", "))")
    }
}

enum TableSection: String, CaseIterable {
    case basicUI = "Basic UI"
    case alerts = "Alerts"
    case banner = "Banner Alerts"
    case sheets = "Selection Sheets"
    case animations = "Animations"
    
    var items: [TableItem] {
        switch self {
        case .basicUI:
            return [.fonts, .labels, .buttons, .pageIndicator]
        case .alerts:
            return [.successAlert, .warningAlert, .errorAlert]
        case .banner:
            return [.successBannerAlert, .infoBannerAlert, .warningBannerAlert, .errorBannerAlert, .customBannerAlert]
        case .sheets:
            return [.singleSelection, .multipleSelection]
        case .animations:
            return [.loadingAnimation, .shimmerAnimation]
        }
    }
}

enum TableItem: String {
    case fonts = "Fonts"
    case labels = "Labels"
    case buttons = "Buttons"
    case pageIndicator = "Page Indicator"
    case successAlert = "Success Alert"
    case warningAlert = "Warning Alert"
    case errorAlert = "Error Alert"
    case successBannerAlert = "Success Banner Alert"
    case warningBannerAlert = "Warning Banner Alert"
    case errorBannerAlert = "Error Banner Alert"
    case infoBannerAlert = "Info Banner Alert"
    case customBannerAlert = "Custom Banner Alert"
    case singleSelection = "Single Selection"
    case multipleSelection = "Multiple Selection"
    case loadingAnimation = "Loading Animation"
    case shimmerAnimation = "Shimmer Animation"
}
