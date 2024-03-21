//
//  IdentifiableCell.swift
//  BrightSky
//
//  Created by Razumov Pavel on 21.03.2024.
//

import UIKit

protocol IdentifiableCell {
    static var reuseId: String { get }
}

extension IdentifiableCell {
    static var reuseId: String { "\(self)"}
}

extension UITableViewCell: IdentifiableCell {}
extension UICollectionViewCell: IdentifiableCell {}
