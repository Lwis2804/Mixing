//  CocktailsListViewController.swift
//  Mixing
//  Created by LUIS GONZALEZ on 22/07/24.
//  
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class CocktailsListViewController: UIViewController {

    var presenter: CocktailsList_ViewToPresenterProtocol?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - P R E S E N T E R · T O · V I E W
extension CocktailsListViewController: CocktailsList_PresenterToViewProtocol {
}
