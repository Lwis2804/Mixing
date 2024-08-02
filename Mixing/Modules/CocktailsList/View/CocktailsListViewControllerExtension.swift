//
//  CocktailsListViewControllerExtension.swift
//  Mixing
//
//  Created by LUIS GONZALEZ on 22/07/24.
//

import UIKit

extension CocktailsListViewController : UICollectionViewDelegate & UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getCocktailsInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cCell = collectionView.dequeueReusableCell(withReuseIdentifier: CocktailsListCollectionViewCell.identifier, for: indexPath) as? CocktailsListCollectionViewCell else { return CocktailsListCollectionViewCell() }
        cCell.configCocktailCell(withEntry: getCocktailsInfo[indexPath.row])
        return cCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let info = getCocktailsInfo[indexPath.row]
        self.presenter?.didSeletc(withResponse: info)
    }

}

extension CocktailsListViewController : UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat(191.0), height: CGFloat(290.0))
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    

}
