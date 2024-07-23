//
//  UiTableViewCell+Extension.swift
//  Mixing
//
//  Created by LUIS GONZALEZ on 22/07/24.
//

import Foundation

import UIKit

//MARK: - UI · C O L L E C T I O N · V I E W · C E L L
extension UICollectionViewCell {
    ///Identifier nos ayudará a poder saber la identidad de nuestra celda, y usarla en cualquiera que herede de UICollectionViewCell
    class var identifier: String { return String(describing: self) }
    class var nib: UINib { return UINib(nibName: identifier, bundle: Bundle(for: CocktailsListCollectionViewCell.self)) }
}
