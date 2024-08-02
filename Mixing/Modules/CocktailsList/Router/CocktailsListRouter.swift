//  CocktailsListRouter.swift
//  Mixing
//  Created by LUIS GONZALEZ on 22/07/24.
//  
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import UIKit

class CocktailsListRouter {
	
    static func createModule() -> UIViewController {
        
        let view = CocktailsListViewController()
        let presenter = CocktailsListPresenter()
        let interactor = CocktailsListInteractor()
        let router = CocktailsListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return view
    }
}

extension CocktailsListRouter: CocktailsList_PresenterToRouterProtocol {
    func goToDetailView(withInfo info: Drinks, andView view: CocktailsList_PresenterToViewProtocol) {
        if let view = view as? CocktailsListViewController {
            let vc = DetailViewRouter.createModule(andInfo: info)
            view.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}
