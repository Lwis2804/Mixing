//  CocktailsListViewController.swift
//  Mixing
//  Created by LUIS GONZALEZ on 22/07/24.
//  
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class CocktailsListViewController: UIViewController {

    @IBOutlet var cocktailsCollectionView: UICollectionView!
    var presenter: CocktailsList_ViewToPresenterProtocol?
    var getCocktailsInfo : [Drinks] = []

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.goToCocktailsList()
        setUpCocktailCollection()
    }
    
    func setUpCocktailCollection() {
        self.cocktailsCollectionView.delegate = self
        self.cocktailsCollectionView.dataSource = self
        self.cocktailsCollectionView.register(CocktailsListCollectionViewCell.nib, forCellWithReuseIdentifier: CocktailsListCollectionViewCell.identifier)
    }
    
    
    
}

// MARK: - P R E S E N T E R · T O · V I E W
extension CocktailsListViewController: CocktailsList_PresenterToViewProtocol {
    func updateCocktailsList(withResponse response: CocktailsList) {
        self.getCocktailsInfo = response.drinks ?? []
        DispatchQueue.main.async {
            self.cocktailsCollectionView.reloadData()
        }
    }
    
}
