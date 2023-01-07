//
//  UICollectionViewCell.swift
//  UIConfig
//
//  Created by Juan Jose Elias Navarro on 07/01/23.
//

import UIKit

public extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

public extension UICollectionView {
    /**
     Register nibs faster by passing the type - if for some reason the `identifier` is different then it can be passed
     - Parameter type: UICollectionViewCelll.Type
     - Parameter identifier: String?
     */
    func registerCell(type: UICollectionViewCell.Type) {
        register(type, forCellWithReuseIdentifier: type.identifier)
    }
    
    /**
     DequeueCell by passing the type of UICollectionViewCell and IndexPath
     - Parameter type: UICollectionViewCell.Type
     - Parameter indexPath: IndexPath
     */
    func dequeueCell<T: UICollectionViewCell>(withType type: UICollectionViewCell.Type, for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath) as? T
    }
    
}
