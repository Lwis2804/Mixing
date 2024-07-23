//  CocktailsListPresenter.swift
//  Mixing
//  Created by LUIS GONZALEZ on 22/07/24.
//  
//  ViperTemplate v.0.0.1 - (2023, NS-Bionick Development Team)

import Foundation

class CocktailsListPresenter: CocktailsList_ViewToPresenterProtocol {

    weak var view: CocktailsList_PresenterToViewProtocol?
    var interactor: CocktailsList_PresenterToInteractorProtocol?
    var router: CocktailsList_PresenterToRouterProtocol?
    
    func goToCocktailsList() {
        interactor?.getCocktailsListToInteractor()
    }
    
}

// MARK: - I N T E R A C T O R · T O · P R E S E N T E R
extension CocktailsListPresenter: CocktailsList_InteractorToPresenterProtocol {
    func getCocktailsListFromInteractor(withResponse response: CocktailsList) {
        view?.updateCocktailsList(withResponse: response)
    }
    

}
